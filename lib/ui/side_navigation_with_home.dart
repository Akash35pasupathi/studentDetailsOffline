import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:student_details_offline/bloc/ItemModel.dart';
import 'package:student_details_offline/bloc/bloc.dart';
import 'package:student_details_offline/custom_widget/ui_utils.dart';
import 'package:student_details_offline/ui/search_page.dart';
import 'package:student_details_offline/util/database.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic dashboardList;
  ClassDetailsBloc classDetailsBloc;

  int parentIndex = 0;

  Future<dynamic> fetchData() async {
    var response;

    await http
        .post('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad')
        .then((http.Response res) {
      response = json.decode(res.body);
    });

    return response;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classDetailsBloc = BlocProvider.of<ClassDetailsBloc>(context);
    classDetailsBloc.add(InitialLoading());
  }

  @override
  Widget build(BuildContext buildContext) {
    return BlocConsumer<ClassDetailsBloc, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is InitialDataLoadState||state is RefreshState)
          return FutureBuilder<List<ClassDetails>>(
              future: DBProvider.db.getAllData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'There was an error :(',
                    style: Theme.of(context).textTheme.headline,
                  );
                } else if (snapshot.hasData) {
                  List<ClassDetails> dashboardList = snapshot.data;
                  return DefaultTabController(
                    length: dashboardList.length,
                    child: Scaffold(
                      appBar: new AppBar(
                        backgroundColor: Colors.teal,
                        title: Text(widget.title),
                        bottom: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.white,
                          indicatorColor: Colors.red,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: new List<Widget>.generate(
                            dashboardList.length,
                            (int index) {
                              return Tab(
                                text: dashboardList[index].name,
                              );
                            },
                          ),
                        ),
                      ),
                      body: dashboardList.length == 0
                          ? Center(
                              child:
                                  Text("No Record, Please Add Class Details"),
                            )
                          : SafeArea(
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: new List<Widget>.generate(
                                  dashboardList.length,
                                  (int index) {
                                    return Center(
                                      child:
                                          tabListWidget(dashboardList[index]),
                                    );
                                  },
                                ),
                              ),
                            ),
                      floatingActionButton: FloatingActionButton(
                        onPressed: () async {
                          _displayDialog(buildContext);
                        },
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                      body: Center(child: CircularProgressIndicator()));
                }
              });
          return Scaffold(
              body: Center(child: CircularProgressIndicator()));
        });
  }
}

_displayDialog(BuildContext buildContext) async {
  TextEditingController _textFieldController = new TextEditingController();

  return showDialog(
      context: buildContext,
      builder: (context) {
        return AlertDialog(
          title: Text('Class Name'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter the class name"),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('Add'),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchStudent(
                          is_add_student: true,
                          class_name: _textFieldController.text.toString())),
                );
                // context.bloc<MyFormBloc>().add(PasswordChanged(password: value));
                Navigator.of(context).pop();
                BlocProvider.of<ClassDetailsBloc>(buildContext).add(RefreshPage());

              },
            )
          ],
        );
      });
}

Widget tabListWidget(ClassDetails listData) {
  List<dynamic> items = jsonDecode(listData.jsonData);
  return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Stack(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  '${items[index]['name']}',
                  style: textFontStyle(
                    fontWeight: FontWeight.w500,
                    fontColor: Colors.black,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '${items[index]['gender']}',
                      style: textFontStyle(
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.black38,
                      ),
                    ),
                    Text(
                      'ID: ${items[index]['id']}',
                      style: textFontStyle(
                        fontWeight: FontWeight.w500,
                        fontColor: Colors.black38,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
        );
      });
}
