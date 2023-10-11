import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackingTracksController extends GetxController {
  static BackingTracksController get to => Get.find();

  bool _challengesState = false;
  bool get challenges => _challengesState;




  bool _drumState = false;
  bool _bassState = false;
  bool _metronomsState = false;

  bool get drumState=> _drumState;
  bool get bassState=> _bassState;
  bool get metronomsState=> _metronomsState;


   void updateChallenges(bool value){
     _challengesState = value;
     update();
   }

  void updateDrumStateChallenges(){
     _drumState = !_drumState;
     update();
  }

   void updateBassStateChallenges(){
     _bassState = !_bassState;
     update();
   }

   void updateMetronomsStateChallenges(){
     _metronomsState = !_metronomsState;
     update();
   }

   List<String> getDummyList(){
     List<String> list = [];
     list.add("A");
     list.add("B");
     list.add("C");
     list.add("D");

     return list;
   }


}
