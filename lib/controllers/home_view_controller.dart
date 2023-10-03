import 'dart:math';

import 'package:get/get.dart';
import 'package:topjoy/constants.dart' as constants;

class HomeViewController extends GetxController{
  int bottlecupstate = 0;
  int random = 0;

  String  giveMeMessage() {
    int random = Random().nextInt(constants.messages.length);
    return (bottlecupstate==10)?constants.messages[random].toUpperCase():"";
  }
  void flipTheBottlecap() async {
    bool condition =(bottlecupstate == 0);
    random= Random().nextInt(constants.messages.length);
    for(int i=(condition)?0:10; 
    (condition) ? i< 11 : i>= 0; (condition)? i++: i--){
      bottlecupstate = i;
       await Future.delayed(Duration(milliseconds: 15));
      update();
    }
  }
}