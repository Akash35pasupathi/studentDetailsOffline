
import 'package:flutter/material.dart';
import 'package:student_details_offline/util/colors_and_images.dart';
import 'package:student_details_offline/util/ui_helpers.dart';

class okOnclick {
  bool screenFinish() {}
}

textFontStyle({
  fontWeight = FontWeight.w400,
  fontColor = Colors.black38,
}) {
  return TextStyle(
    fontFamily: 'Poppins',
    color: fontColor,
    fontSize: 16,
    fontWeight: fontWeight,
  );
}

class WepAppDialog {
  Color PrimaryColor = ColorAndImageData.initialPrimaryColor;
  customDialog(String title, String subtitle, context1, String actionText,
      {bool isForceFinishScreeen, bool isFromHelpDesk}) {
    showDialog(
      context: context1,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(UIHelper.BorderRadiusSmall)),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Icon(
                    Icons.info_outline,
                    color: PrimaryColor,
                    size: 80,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: UIHelper.FontMediumLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Center(
                  child: Text(
                    (subtitle == null) ? "" : subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: UIHelper.FontMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: SizedBox(
                    height: 37,
                    width: 150,
                    child: RaisedButton(
                        color: PrimaryColor,
                        child: Text(
                          actionText,
                          style: TextStyle(
                            fontSize: UIHelper.FontRegular,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (isFromHelpDesk != null && isFromHelpDesk) {
                            Navigator.of(context1, rootNavigator: true)
                                .pop(['S']);
                          }

                          if (isForceFinishScreeen) {
                            Navigator.of(context1).pop();
                          }
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(
                              UIHelper.BorderRadiusLarge),
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
