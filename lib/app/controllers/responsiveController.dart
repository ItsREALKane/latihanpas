import 'package:get/get.dart';

class ResponsiveContoller extends GetxController {
  var screenWidth = 0.0.obs;

  void updateScreenWidht(double width){
    screenWidth.value = width;
    print('size nya' + screenWidth.value.toString());
  }

//ini aku balik soalnya error
  bool isTablet() => screenWidth.value < 361;
  bool isMobile() => screenWidth.value >= 800 && screenWidth.value < 1200;
}