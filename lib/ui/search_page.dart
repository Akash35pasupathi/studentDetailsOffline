import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_details_offline/bloc/ItemModel.dart';
import 'package:student_details_offline/custom_widget/ui_utils.dart';
import 'package:student_details_offline/router.dart';
import 'package:http/http.dart' as http;
import 'package:student_details_offline/util/database.dart';


class SearchStudent extends StatefulWidget {

  bool is_add_student;
  String class_name;
  SearchStudent({Key key, this.is_add_student,this.class_name}) : super(key: key);


  @override
  _MyHomePageState createState() => new _MyHomePageState(is_add_student:is_add_student,class_name:class_name);
}

class _MyHomePageState extends State<SearchStudent> {

  bool is_add_student;
  String class_name;
  bool isAddBtnEnable=false;

  TextEditingController editingController = TextEditingController();

  var duplicateItems= List<Item>();

  var items = List<Item>();

  Future<dynamic> jsonFetch() async {
    if(duplicateItems.length==0) {
      var response;

      await http
          .post(
          'http://www.json-generator.com/api/json/get/bVcthvVvZu?indent=2')
          .then((http.Response res) {
        response = json.decode(res.body);
      });

      for (int i = 0; i < response['data'].length; i++) {
        var obj = response['data'][i];
        Item itemObj = new Item(
            obj['Name'].toString(), obj['Gender'] == 1 ? "Female" : "Male",
            obj['ID'].toString());

        duplicateItems.add(itemObj);
        items.add(itemObj);
      }

      return response;
    }else{
      return true;
    }

  }

  @override
  void initState() {
    //items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Item> dummySearchList = List<Item>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<Item> dummyListData = List<Item>();
      dummySearchList.forEach((item) {
        if (item.getName().toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }


  _MyHomePageState({this.is_add_student,this.class_name});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: jsonFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
              'There was an error :(',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline,
            );
          } else if (snapshot.hasData) {
            return MaterialApp(
              onGenerateRoute: Router.createRoute,
              home: new Scaffold(
                appBar: new AppBar(
                  title: new Text("Student List"),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                bottomNavigationBar: Visibility(
                  visible: isAddBtnEnable,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () async {

                       List<Item> selectedItem=new List();
                        items.forEach((element) {
                          if(element.isSelect)
                            {

                              selectedItem.add(element);

                            }
                        });
                        String resJsonStr = jsonEncode(selectedItem);


                       ClassDetails rnd = ClassDetails(
                           name:class_name,
                           jsonData: "" + resJsonStr.toString(),
                           );
                       await DBProvider.db.newClassDetails(rnd);

                        Navigator.of(context).pop();

                      },
                      child: Text("SUBMIT"),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                body: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            filterSearchResults(value);
                          },
                          controller: editingController,
                          decoration: InputDecoration(
                              labelText: "Search Student",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Card(
                                  child: ListTile(
                                    title: Text(
                                      '${items[index].getName()}',
                                      style: textFontStyle(
                                        fontWeight: FontWeight.w500,
                                        fontColor: Colors.black,
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: <Widget>[
                                        Text(
                                          '${items[index].getGender()}',
                                          style: textFontStyle(
                                            fontWeight: FontWeight.w500,
                                            fontColor: Colors.black38,
                                          ),
                                        ),
                                        Text(
                                          'ID: ${items[index].getDob()}',
                                          style: textFontStyle(
                                            fontWeight: FontWeight.w500,
                                            fontColor: Colors.black38,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: (){
                                      setState(() {
                                        if(items[index].isSelect) {
                                          items[index].setIsSelected(false);
                                          isAddBtnEnable=false;
                                        }else{
                                          items[index].setIsSelected(true);
                                        }
                                        items.forEach((element) {
                                          if(element.isSelect)
                                          isAddBtnEnable=true;
                                        });
                                      });
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible:items[index].isSelect,
                                  child: Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Icon(Icons.done,size:35,color: Colors.green,),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });
  }
}

class Item {
  String name;
  String gender;
  String id;
  bool isSelect=false;

  // setter

  String getName() {
    return name;
  }

  String getGender() {
    return gender;
  }

  String getDob() {
    return id;
  }

  void setName(String name) {
    this.name = name;
  }

  void setGender(String gender) {
    this.gender = gender;
  }

  void setDob(String dob) {
    this.id = dob;
  }


  void setIsSelected(bool isSelect) {
    this.isSelect = isSelect;
  }

  Item(this.name, this.gender, this.id);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'gender':gender,
    };
  }
}


