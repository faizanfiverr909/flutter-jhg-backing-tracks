import 'package:blocking_tracks/controllers/challenges_controller.dart';
import 'package:blocking_tracks/decorations/BoxDecorations.dart';
import 'package:blocking_tracks/decorations/ButtonDecorations.dart';
import 'package:blocking_tracks/widgets/drop_down_widget.dart';
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
                      child: DropDownWidget(
                        value: _controller.dropDownSelectedValue,
                        items: _controller.itemsList,
                        expandedColor: CustomColors.liteWhite,
                        hint: "Frequency",
                        onChanged: (value) async {
                          if (value != null) {
                            _controller.setDropDownValue(value);
                          }
                        },
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
