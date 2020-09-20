import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorAndImageData {
  //Images
  static const String checked = 'assets/image/checked.png';
  static const String plus = 'assets/image/plus.png';
  static const String paper = 'assets/image/2x/paper.png';
  static const String filter = 'assets/image/filter.png';
  static const String calendar = 'assets/image/calendar.png';
  static const String airplane = 'assets/image/airplane.png';
  static const String calendars = 'assets/image/calendars.png';
  static const String claim = 'assets/image/claim.png';
  static const String clock = 'assets/image/clock.png';
  static const String computing = 'assets/image/computing.png';
  static const String information = 'assets/image/information.png';
  static const String purse = 'assets/image/purse.png';
  static const String home = 'assets/image/home.png';
  static const String growth = 'assets/image/growth.png';
  static const String board = 'assets/image/board.png';
  static const String menu = 'assets/image/menu.png';
  static const String delete = 'assets/image/delete.png';
  static const String edit = 'assets/image/ic_pencil.png';
  static const String employment = 'assets/image/employment.png';
  static const String talent_acquistion = 'assets/image/talent_acquistion.png';
  static const String training = 'assets/image/training.png';

  //Colors
  static const Color initialPrimaryColor = const Color(0xFF673ab7);
  static const Color assignedColor = const Color(0xFF9BC800);
  static const Color locationColor = const Color(0xFF2AA8E2);
  static const Color labelColor = const Color(0xFFADADAD);
  static const Color shadowColor = const Color(0xFFCDCDCD);
  static const Color submitColor = const Color(0xFF2AA8E2);
  static const Color backgroundColor = const Color(0xFFF8F8F8);

  static const Color pendingTextColor = const Color(0xFFFF2C00);
  static const Color acceptedTextColor = const Color(0xFF9BC800);
  static const Color handoverTextColor = const Color(0xFFFFB300);
  static const Color rejectedTextColor = const Color(0xFFFF2C00);
  static const Color lightGrey = const Color(0xFFF6F6F6);

  returnAmountValue(String amount){
    String amountToPassed ="0";

    if(amount.isEmpty || amount == null){
      amountToPassed = "0";
    }else{
      amountToPassed = amount;
    }

    return amountToPassed;
  }

  static dynamic getOrientation(){
    List<DeviceOrientation> orientation;
    orientation=[DeviceOrientation.portraitUp];
   return  orientation;
  }

  static dynamic gerOrientationForChartAndMISFilter(){
    List<DeviceOrientation> orientation;
    orientation=[DeviceOrientation.portraitUp,DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft];
    return  orientation;
  }

}




