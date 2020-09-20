import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double VerticalSpaceSmall = 10.0;
  static const double VerticalSpaceSmall1 = 15.0;
  static const double NoSpace = 0.0;
  static const double VerticalSpaceSmall2 = 5.0;
  static const double VerticalSpaceMedium = 20.0;
  static const double VerticalSpaceMedium2 = 30.0;
  static const double VerticalSpaceLarge0 = 45.0;
  static const double VerticalSpaceLarge = 60.0;
  static const double VerticalSpaceLarge1 = 80.0;

  static const double marginSmall = 10.00;
  static const double marginMedium = 15.00;
  static const double marginLarge = 20.00;
  static const double marginRegular = 16.00;
  static const double marginVerySmall = 8.0;
  static const double marginSmall1 = 12.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double HorizontalSpaceSmall = 10.0;
  static const double HorizontalSpaceSmall1 = 5.0;
  static const double HorizontalSpaceSmall2 = 8.0;
  static const double VerticalSpaceVerySmall = 4.0;
  static const double HorizontalSpaceVerySmall = 4.0;
  static const double VerticalSpaceVerySmall1 = 2.0;

  static const double HorizontalSpaceMedium = 20.0;
  static const double HorizontalSpaceLarge = 60.0;

  static const double MarginAllVerySmall = 2.0;

  static const double PaddingAllSmall = 5.0;
  static const double PaddingAllSmall1 = 8.0;
  static const double WidthSmall = 0.5;

  static const double PaddingAllMedium = 10.0;
  static const double PaddingAllLarge = 15.0;
  static const double PaddingOnlyBottom = 100;

  static const double LogoUiWidth = 250.0;
  static const double LogoUiHeight = 150.0;

  static const double CardUiWidth = 300.0;
  static const double CardUiHeight = 75.0;

  static const double FontSizeSmall = 12.0;
  static const double FontSizeMedium = 14.0;
  static const double FontSizeXMedium = 16.0;
  static const double FontSizeLarge = 18.0;
  static const double FontSizeXLarge = 20.0;

  static const double CircleAvatarWidth = 150.0;
  static const double CircleAvatarHeight = 150.0;
  static const double CircleAvatarRadius = 90.0;
  static const double CircleAvatarRadiusSmall = 65.0;

  static const double HintIconSize = 25.0;

  static const double LineHeight = 1.0;
  static const double BorderWidthSmall = 1.0;
  static const double MarginAllVeryMedium = 2.0;
  static const double MarginVerySmall = 6.0;
  static const double MarginAllVeryLarge = 20.0;
  static const double MarginAllVeryExtraLarge = 30.0;
  static const double MarginRegular = 16.0;

  // this is for reset password screen text view size
  static const double FontUltraSmall = 6.0;
  static const double FontVerySmall = 10.0;
  static const double FontSmallSize = 11.0;
  static const double FontVerySmall1 = 9.0;
  static const double FontSmall = 12.0;
  static const double FontSmall2 = 12.0;
  static const double FontSizesmall = 13.0;
  static const double FontMedium = 14.0;
  static const double FontMedium1 = 15.0;
  static const double FontLarge = 16.0;
  static const double FontRegular = 18.0;
  static const double FontMediumLarge = 20.0;
  static const double FontExtraLarge = 22.0;
  static const double BorderRadiusSmall = 30.0;
  static const double BorderRadiusLarge = 30.0;
  static const double BorderRadiusMedium = 20.0;
  static const double PaddingSmall = 5.0;

  // Divider
  static const double DividerLargeHeight = 25;
  static const double DividerLargeWidth = 40;

  // sized Box
  static const double MaxWidth = 600.0;
  static const double MinHeight = 30.0;
  static const double SizedBoxMinHeight = 38.0;
  static const double SizedBoxMaxHeight = 46.0;
  static const double SizedBoxVerySmall = 8.0;
  static const double RaisedButtonHeight = 55.0;
  static const double RaisedButtonHeight1 = 45.0;
  static const double RaisedButtonHeightmin = 35.0;
  static const double ProfileSizedBox = 30.0;
  static const double FieldSizedBox = 76.0;

  // MediaQuery Size
  static const double MediaQuerySmallHeight = 25.0;
  static const double MediaQueryLargeHeight = 45.0;
  // Border Radius for Container
  static const double BorderRadiusX = 670.0;
  static const double BorderRadiusY = 350.0;
  static const double BorderRadiusVerySmall = 350.0;
  static const double BorderRadiusCircularSmall = 20;
  static const double CardElevationSmall = 10;
  static const double ButtonPadding = 50;

  static const double HeightOfContainer = 13.5;
  static const double BottomContainerHeight = 135;
  static const double BottomContainerHeight1 = 69;
  static const double BottomContainerHeightsmall = 49;

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(VerticalSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}
