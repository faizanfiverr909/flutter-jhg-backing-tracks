import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/challenges_model.dart';

class ChallengesController extends GetxController {
  final List<String> _items = [
  "Every Chord",
  "Every 2nd Chord",
  "Every 4th Chord",
  "Every 8th Chord",
  "Every 16th Chord",
  ];

  List<String> get itemsList => _items;

  String? _dropDownSelectedValue ;

  String? get dropDownSelectedValue => _dropDownSelectedValue;
  
  List<ChallengesModel> challengesList = [];
  @override
  void onInit() {
    super.onInit();
    challengesList=[];
    challengesList.add(ChallengesModel("Chord Tones", false));
    challengesList.add(ChallengesModel("4ths & 6ths", false));
    challengesList.add(ChallengesModel("Intervals", false));
    challengesList.add(ChallengesModel("Modes", false));
    challengesList.add(ChallengesModel("Scales", false));
    challengesList.add(ChallengesModel("Shapes", false));
    challengesList.add(ChallengesModel("Strings", false));
    challengesList.add(ChallengesModel("Strings (Double)", false));
    challengesList.add(ChallengesModel("Tonality", false));
  }

  void clearDropDownValue() {
    _dropDownSelectedValue = null;
    update();
  }
  
  void setDropDownValue(String value) {
    _dropDownSelectedValue = value;
    update();
  }

  void setIsSwitchIn(int index, bool value) {
    challengesList[index].isSwitchedOn = value;
    update();
  }
}
