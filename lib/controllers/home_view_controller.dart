import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:topjoy/constants.dart' as constants;

class HomeViewController extends GetxController{
  BuildContext context;
  HomeViewController(this.context);

  bool isInitialized=false;

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
  Future<void> preloadAllImages()  async{
    for (int i = 0; i<11; i++){
      await(AssetImage('images/bottlecap_$i.png'),context);

    }

  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await preloadAllImages();
    isInitialized = true;
    //await Future.delayed(Duration(milliseconds: 2000));
    update();

  }
}