import 'package:blocking_tracks/dialogs/backing_tracks_open_dialog.dart';
import 'package:blocking_tracks/widgets/drop_down_widget.dart';
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

class BackingTracksKeyDialog extends StatelessWidget {
  CanvasChardsController _controller = Get.put(CanvasChardsController());
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
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      right: 15.dp, left: 15.dp),
                                  decoration:
                                      ButtonDecorations.buttonSelected(),
                                  child: GestureDetector(
                                    child: Center(
                                        child: Text(
                                      Strings.key,
                                      style:
                                          CustomTextStyles.whiteTextStyle(16),
                                    )),
                                    onTap: () => {},
                                  )),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15.dp, right: 15.dp),
                                  decoration:
                                      ButtonDecorations.defaultStrokeButton(),
                                  child: GestureDetector(
                                    child: Center(
                                        child: Text(
                                      Strings.open,
                                      style:
                                          CustomTextStyles.whiteTextStyle(16),
                                    )),
                                    onTap: () => {
                                      Get.back(),
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return BackingTracksOpenDialog();
                                          }),
                                    },
                                  )),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: DropDownWidget(
                                    value: _controller.dropDownKeySelectedValue,
                                    items: _controller.itemKeyList,
                                    expandedColor: CustomColors.liteWhite,
                                    onChanged: (value) async {
                                      if (value != null) {
                                        _controller.setDropDownKeyValue(value);
                                      }
                                    },
                                  ),
                                )),
                          ),
                          Flexible(
                            flex: 7,
                            fit: FlexFit.tight,
                            child: Padding(
                                padding: EdgeInsets.only(top: 5.h, left: 20.dp),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: DropDownWidget(
                                    value: _controller
                                        .dropDownTonalitiesSelectedValue,
                                    items: _controller.itemTonalitiesList,
                                    expandedColor: CustomColors.liteWhite,
                                    onChanged: (value) async {
                                      if (value != null) {
                                        _controller
                                            .setDropDownTonalitiesValue(value);
                                      }
                                    },
                                  ),
                                )),
                          )
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Center(
                          child: populateGridData(),
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
                                              CustomTextStyles.whiteTextStyle(
                                                  17),
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 40.dp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 55.dp,
                                            height: 55.dp,
                                            margin:
                                                EdgeInsets.only(right: 15.dp),
                                            child: Image.asset(
                                                CustomImages.previousButton)),
                                        Container(
                                            width: 55.dp,
                                            height: 55.dp,
                                            margin:
                                                EdgeInsets.only(left: 15.dp),
                                            child: Image.asset(
                                                CustomImages.nextButton)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.dp,
                                        right: 10.dp,
                                        bottom: 30.dp),
                                    child: Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.4,
                                          child: Checkbox(
                                            value:
                                                _controller.defaultEditingPanel,
                                            onChanged: (value) {
                                              if (value != null) {
                                                _controller
                                                    .setDefaultEditingPanel(
                                                        value);
                                              }
                                            },
                                            checkColor: CustomColors.greyColor,
                                            activeColor:
                                                CustomColors.whiteColor,
                                            side: const BorderSide(
                                                color: CustomColors.whiteColor),
                                          ),
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
                                              style: CustomTextStyles
                                                  .whiteTextStyle(16),
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
              )));
    });
  }

  Widget populateGridData() {
    return Padding(
        padding:
            EdgeInsets.only(left: 25.dp, right: 25.dp, top: 5.dp, bottom: 5.dp),
        child: GridView.builder(
            itemCount: _controller.chardsGridData.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 25.dp,
                mainAxisSpacing: 20.dp,
                mainAxisExtent: 60.dp),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  width: 50.dp,
                  height: 50.dp,
                  decoration: index == 0
                      ? BoxDecorations.blueBoxDecoration(8)
                      : BoxDecorations.selectedBoxDecoration(),
                  child: Center(
                    child: Text(
                      _controller.chardsGridData[index],
                      style: CustomTextStyles.white14TextStyle,
                    ),
                  ),
                ),
                onTap: () => {},
              );
            }));
  }
}
