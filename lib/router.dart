import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_details_offline/ui/search_page.dart';
import 'package:student_details_offline/ui/side_navigation_with_home.dart';

class Router {
  static const String homeLogin = '/';
  static const String registration = '/registration';
  static const String searchStudent = '/SearchStudent';
  static const String dashboard = '/Dashboard';

  static pushNavigationAndRemoveUntil(
      BuildContext context, String pathURI, dynamic nextPage) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return nextPage;
    }), ModalRoute.withName(pathURI));
  }

  static pushNavigation(BuildContext context, dynamic nextPage) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return nextPage;
      },
    ));
  }

  static Route<dynamic> createRoute(RouteSettings settings) {
    switch (settings.name) {

      case searchStudent:
        return MaterialPageRoute(builder: (_) {
          return SearchStudent();
        });

      case dashboard:
        return MaterialPageRoute(builder: (_) {
          return MyHomePage(
            title: "Dashboard",
          );
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
