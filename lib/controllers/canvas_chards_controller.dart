import 'package:get/get.dart';

class CanvasChardsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    dropDownKeySelectedValue = "A";
    dropDownTonalitiesSelectedValue = "Major";
    dropDownKeySelectedValueOpen = "A";
    dropDownTonalitiesSelectedValueOpen = "Major";
  }

  final List<String> _items = [
    'A',
    'A#',
    'B',
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
  ];

  final List<String> _itemsOpen = [
    'A',
    'A#',
    'B',
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
  ];

  final List<String> _itemsTonalities = [
    'Major',
    'Minor',
    'Major7',
    'Minor7',
    'Dom7',
  ];
  final List<String> _itemsTonalitiesOpen = [
    'Major',
    'Minor',
    'Major7',
    'Minor7',
    'Dom7',
  ];

  final List<String> _canvasChardsGridData = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6'
  ];

  List<String> get itemKeyList => _items;
  List<String> get itemKeyListOpen => _itemsOpen;

  List<String> get itemTonalitiesList => _itemsTonalities;
  List<String> get itemTonalitiesListOpen => _itemsTonalitiesOpen;

  List<String> get chardsGridData =>_canvasChardsGridData;

  String dropDownKeySelectedValue = "";
  String dropDownKeySelectedValueOpen = "";
  String dropDownTonalitiesSelectedValue = "";
  String dropDownTonalitiesSelectedValueOpen = "";


  bool defaultEditingPanel = true;
  bool defaultEditingPanelOpen = true;


  void setDropDownKeyValue(String value) {
    dropDownKeySelectedValue = value;
    update();
  }

  void setDropDownKeyValueOpen(String value) {
    dropDownKeySelectedValueOpen = value;
    update();
  }

  void setDropDownTonalitiesValue(String value) {
    dropDownTonalitiesSelectedValue = value;
    update();
  }

  void setDropDownTonalitiesValueOpen(String value) {
    dropDownTonalitiesSelectedValueOpen = value;
    update();
  }

  void setDefaultEditingPanel(bool value) {
    defaultEditingPanel = value;
    update();
  }

  void setDefaultEditingPanelOpen(bool value) {
    defaultEditingPanelOpen = value;
    update();
  }
}
