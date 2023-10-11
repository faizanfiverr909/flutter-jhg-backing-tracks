import 'package:blocking_tracks/controllers/challenges_controller.dart';
import 'package:blocking_tracks/decorations/BoxDecorations.dart';
import 'package:blocking_tracks/decorations/ButtonDecorations.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../resources/CustomColors.dart';
import '../resources/CustomImages.dart';
import '../resources/Strings.dart';
import '../styles/customtext_styles.dart';

class ChallengesDialog extends StatelessWidget {
  ChallengesController _controller = Get.put(ChallengesController());
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = (MediaQuery.of(context).size.height) - 100.dp;
    width = (MediaQuery.of(context).size.width) - 50.dp;
    _controller.clearDropDownValue();
    return GetBuilder<ChallengesController>(builder: (_) {
      return Scaffold(
        backgroundColor: CustomColors.dialogBackground,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20.dp),
            width: width,
            height: height,
            decoration: BoxDecorations.dialogBackground(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 30.dp),
                    child: Text(
                      Strings.challenges,
                      style: CustomTextStyles.whiteTextStyleBold(18),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 15.dp),
                    child: Text(
                      Strings.challengesDescription,
                      style: CustomTextStyles.whiteTextStyle(12),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 60.dp,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Padding(
                              padding: EdgeInsets.only(left: 15.dp),
                              child: Text(
                                "Frequency",
                                style: CustomTextStyles.whiteTextStyle(13),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            items: _controller.itemsList
                                .map((String item) => DropdownItem<String>(
                                    value: item,
                                    height: 60.dp,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15.dp),
                                      child: Text(
                                        item,
                                        style:
                                            CustomTextStyles.whiteTextStyle(13),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )))
                                .toList(),
                            dropdownSeparator: DropdownSeparator(
                              height: 1.dp,
                              child: const Divider(
                                color: CustomColors.divider,
                              ),
                            ),
                            value: _controller.dropDownSelectedValue,
                            onChanged: (String? value) {
                              if (value != null) {
                                _controller.setDropDownValue(value);
                              }
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: EdgeInsets.only(right: 15.dp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: CustomColors.greyLightColor,
                                ),
                                color: CustomColors.greyLightColor,
                              ),
                              elevation: 0,
                            ),
                            iconStyleData: IconStyleData(
                              icon: SizedBox(
                                  width: 15.dp,
                                  height: 15.dp,
                                  child: Image.asset(CustomImages.arrowDown)),
                              iconSize: 14,
                              iconEnabledColor: CustomColors.whiteColor,
                              iconDisabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                color: CustomColors.greyLightColor,
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                              offset: Offset(0, 8.dp),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ListView(
                      children: [populateSelectedTypeList()],
                    )),
                Row(children: [
                  Expanded(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                            height: 55.dp,
                            child: InkWell(
                              child: Container(
                                  width: double.infinity,
                                  decoration: ButtonDecorations.saveButton(),
                                  child: Center(
                                    child: Text(
                                      Strings.save,
                                      style:
                                          CustomTextStyles.whiteTextStyle(16),
                                    ),
                                  )),
                              onTap: () => {debugPrint("save")},
                            ))),
                  )
                ])
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget populateSelectedTypeList() {
    return Container(
        margin: EdgeInsets.only(top: 30.dp),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var model = _controller.challengesList[index];
              return Container(
                margin: EdgeInsets.only(top: 10.dp, left: 15.dp, right: 5.dp),
                height: 50.dp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.text,
                      style: CustomTextStyles.whiteMediumTextStyle,
                    ),
                    SizedBox(
                        width: 60.dp,
                        child: Switch(
                            value: model.isSwitchedOn,
                            activeColor: CustomColors.blackColor,
                            activeTrackColor: CustomColors.greenToggleColor,
                            inactiveThumbColor: CustomColors.blackColor,
                            inactiveTrackColor: CustomColors.greyLightColor,
                            onChanged: (bool value) {
                              _controller.setIsSwitchIn(index, value);
                            }))
                  ],
                ),
              );
            },
            itemCount: _controller.challengesList.length));
  }
}
