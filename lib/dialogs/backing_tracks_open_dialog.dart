import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/canvas_chards_controller.dart';
import '../decorations/BoxDecorations.dart';
import '../decorations/ButtonDecorations.dart';
import '../resources/CustomColors.dart';
import '../resources/CustomImages.dart';
import '../resources/Strings.dart';
import '../styles/customtext_styles.dart';

class BackingTracksOpenDialog extends StatelessWidget {
  CanvasChardsController _controller = Get.find<CanvasChardsController>();
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = (MediaQuery.of(context).size.height) - 50.dp;
    width = (MediaQuery.of(context).size.width) - 50.dp;
    return GetBuilder<CanvasChardsController>(builder: (_) {
      return Scaffold(
          backgroundColor: CustomColors.dialogBackground,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.dp),
                width: width,
                height: height,
                decoration: BoxDecorations.dialogBackground(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 55.dp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Container(
                                margin:
                                    EdgeInsets.only(right: 15.dp, left: 15.dp),
                                decoration:
                                    ButtonDecorations.defaultStrokeButton(),
                                child: GestureDetector(
                                  child: Center(
                                      child: Text(
                                    Strings.key,
                                    style: CustomTextStyles.whiteTextStyle(16),
                                  )),
                                  onTap: () => {},
                                )),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 15.dp, right: 15.dp),
                                decoration: ButtonDecorations.buttonSelected(),
                                child: GestureDetector(
                                  child: Center(
                                      child: Text(
                                    Strings.open,
                                    style: CustomTextStyles.whiteTextStyle(16),
                                  )),
                                  onTap: () => {},
                                )),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 60.dp,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        items: _controller.itemKeyListOpen
                                            .map((String item) =>
                                                DropdownItem<String>(
                                                  value: item,
                                                  height: 60.dp,
                                                  child: Text(
                                                    item,
                                                    style: CustomTextStyles
                                                        .whiteTextStyle(15),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        dropdownSeparator: DropdownSeparator(
                                          height: 1.dp,
                                          child: const Divider(
                                            color: CustomColors.divider,
                                          ),
                                        ),
                                        value: _controller
                                            .dropDownKeySelectedValueOpen,
                                        onChanged: (String? value) {
                                          if (value != null) {
                                            _controller
                                                .setDropDownKeyValueOpen(value);
                                          }
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          padding:
                                              EdgeInsets.only(right: 10.dp),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  CustomColors.greyLightColor,
                                            ),
                                            color: CustomColors.greyLightColor,
                                          ),
                                          elevation: 0,
                                        ),
                                        iconStyleData: IconStyleData(
                                          icon: SizedBox(
                                              width: 15.dp,
                                              height: 15.dp,
                                              child: Image.asset(
                                                  CustomImages.arrowDown)),
                                          iconSize: 14,
                                          iconEnabledColor:
                                              CustomColors.whiteColor,
                                          iconDisabledColor: Colors.white,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                            maxHeight: 200.dp,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8)),
                                              color:
                                                  CustomColors.greyLightColor,
                                            ),
                                            scrollbarTheme: ScrollbarThemeData(
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
                                            ),
                                            offset: Offset(0, 10.dp),
                                            elevation: 0),
                                        menuItemStyleData: MenuItemStyleData(
                                          padding: EdgeInsets.only(
                                              left: 15.dp, right: 15.dp),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Flexible(
                            flex: 7,
                            fit: FlexFit.tight,
                            child: Padding(
                                padding: EdgeInsets.only(top: 5.h, left: 20.dp),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 60.dp,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        items: _controller.itemTonalitiesListOpen
                                            .map((String item) =>
                                                DropdownItem<String>(
                                                    value: item,
                                                    height: 60.dp,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.dp),
                                                      child: Text(
                                                        item,
                                                        style: CustomTextStyles
                                                            .whiteTextStyle(15),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    )))
                                            .toList(),
                                        dropdownSeparator: DropdownSeparator(
                                          height: 1.dp,
                                          child: const Divider(
                                            color: CustomColors.divider,
                                          ),
                                        ),
                                        value: _controller
                                            .dropDownTonalitiesSelectedValueOpen,
                                        onChanged: (String? value) {
                                          if (value != null) {
                                            _controller
                                                .setDropDownTonalitiesValueOpen(
                                                    value);
                                          }
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          padding:
                                              EdgeInsets.only(right: 15.dp),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  CustomColors.greyLightColor,
                                            ),
                                            color: CustomColors.greyLightColor,
                                          ),
                                          elevation: 0,
                                        ),
                                        iconStyleData: IconStyleData(
                                          icon: SizedBox(
                                              width: 15.dp,
                                              height: 15.dp,
                                              child: Image.asset(
                                                  CustomImages.arrowDown)),
                                          iconSize: 14,
                                          iconEnabledColor:
                                              CustomColors.whiteColor,
                                          iconDisabledColor: Colors.white,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8)),
                                              color:
                                                  CustomColors.greyLightColor,
                                            ),
                                            scrollbarTheme: ScrollbarThemeData(
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
                                            ),
                                            offset: Offset(0, 10.dp),
                                            elevation: 0),
                                        menuItemStyleData: MenuItemStyleData(
                                          padding: EdgeInsets.only(
                                              left: 15.dp, right: 15.dp),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: SizedBox(
                                child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 35.dp),
                                    child: Center(
                                      child: Text(
                                        "Currently Editing: 1/4",
                                        style:
                                            CustomTextStyles.whiteTextStyle(17),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 40.dp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 55.dp,
                                          height: 55.dp,
                                          margin: EdgeInsets.only(right: 15.dp),
                                          child: Image.asset(
                                              CustomImages.previousButton)),
                                      Container(
                                          width: 55.dp,
                                          height: 55.dp,
                                          margin: EdgeInsets.only(left: 15.dp),
                                          child: Image.asset(
                                              CustomImages.nextButton)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.dp, right: 10.dp, bottom: 30.dp),
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.4,
                                        child: Checkbox(
                                            value:
                                                _controller.defaultEditingPanelOpen,
                                            onChanged: (value) {
                                              if (value != null) {
                                                _controller
                                                    .setDefaultEditingPanelOpen(
                                                        value);
                                              }
                                            },
                                            checkColor: CustomColors.greyColor,
                                            activeColor:
                                                CustomColors.whiteColor,
                                            side: const BorderSide(
                                                color:
                                                    CustomColors.whiteColor)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.dp),
                                        child: Text(
                                          "Default Editing Panel",
                                          style:
                                              CustomTextStyles.whiteTextStyle(
                                                  13),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                    child: Container(
                                        width: double.infinity,
                                        decoration:
                                            ButtonDecorations.saveButton(),
                                        child: SizedBox(
                                          height: 55.dp,
                                          child: Center(
                                              child: Text(
                                            Strings.save,
                                            style:
                                                CustomTextStyles.whiteTextStyle(
                                                    16),
                                          )),
                                        )),
                                    onTap: () => {debugPrint("save")})
                              ],
                            ))),
                      )
                    ])
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
