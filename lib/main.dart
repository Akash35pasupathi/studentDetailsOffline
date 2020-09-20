import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_details_offline/bloc/bloc.dart';
import 'package:student_details_offline/router.dart';
import 'package:student_details_offline/ui/side_navigation_with_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.createRoute,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create:(context)=>ClassDetailsBloc(InitialDataLoadState()),
          child: MyHomePage(title: 'Student Details')),
    );
  }
}

