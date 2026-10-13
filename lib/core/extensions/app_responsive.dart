import 'package:flutter/material.dart';


const double _designWidth = 390.0;
const double _designHeight = 844.0;

extension AppNumResponsive on num {

  double get rWidth => (this / _designWidth) * _screenWidth;


  double get rHeight => (this / _designHeight) * _screenHeight;


  double get sp {
    final scale = _screenWidth / _designWidth;
    return (this * scale).clamp(this * 0.85, this * 1.25);
  }


  Widget get hSpace => SizedBox(height: rHeight);


  Widget get wSpace => SizedBox(width: rWidth);


  double get _screenWidth {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    return window.physicalSize.width / window.devicePixelRatio;
  }


  double get _screenHeight {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    return window.physicalSize.height / window.devicePixelRatio;
  }
}

extension AppContextResponsive on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get availableHeight {
    const appBarHeight = kToolbarHeight;
    final statusBarHeight = MediaQuery.paddingOf(this).top;
    return screenHeight - appBarHeight - statusBarHeight;
  }


  bool get isSmallScreen => screenHeight < 690;
  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;


  double rWidth(double px) => (px / _designWidth) * screenWidth;
  double rHeight(double px) => (px / _designHeight) * screenHeight;

  ///  (Paddings & Margins)
  EdgeInsets spaceAll(double px) => EdgeInsets.all(rWidth(px));

  EdgeInsets spaceHorizontal(double px) =>
      EdgeInsets.symmetric(horizontal: rWidth(px));

  EdgeInsets spaceVertical(double px) =>
      EdgeInsets.symmetric(vertical: rHeight(px));

  EdgeInsets spaceSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: rWidth(horizontal),
      vertical: rHeight(vertical),
    );
  }

  EdgeInsets spaceFromLTRB(
      double left,
      double top,
      double right,
      double bottom,
      ) {
    return EdgeInsets.fromLTRB(
      rWidth(left),
      rHeight(top),
      rWidth(right),
      rHeight(bottom),
    );
  }

  EdgeInsetsDirectional spaceTop(double px) =>
      EdgeInsetsDirectional.only(top: rHeight(px));

  EdgeInsetsDirectional spaceBottom(double px) =>
      EdgeInsetsDirectional.only(bottom: rHeight(px));

  EdgeInsetsDirectional spaceStart(double px) =>
      EdgeInsetsDirectional.only(start: rWidth(px));

  EdgeInsetsDirectional spaceEnd(double px) =>
      EdgeInsetsDirectional.only(end: rWidth(px));

  BorderRadius circularRadius(double px) => BorderRadius.circular(px);
}

