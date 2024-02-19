import 'package:blocking_tracks/dialogs/backing_tracks_challenges_dialog.dart';
import 'package:blocking_tracks/resources/CustomColors.dart';
import 'package:blocking_tracks/resources/CustomImages.dart';
import 'package:blocking_tracks/resources/Strings.dart';
import 'package:blocking_tracks/routes/route_pages.dart';
import 'package:blocking_tracks/routes/routes.dart';
import 'package:blocking_tracks/styles/customtext_styles.dart';
import 'package:blocking_tracks/utils/app_constant.dart';
import 'package:blocking_tracks/utils/app_subscription.dart';
import 'package:blocking_tracks/widgets/populate_main_canvas_list.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reg_page/reg_page.dart';

import 'controllers/backing_tracks_controllers.dart';
import 'decorations/BoxDecorations.dart';

void main() {

  Get.put(BackingTracksController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
    buildSignature: '',
    installerStore: '',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: CustomColors.backgroundColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,

        home: SplashScreen(
          yearlySubscriptionId: yearlySubscription(),
          monthlySubscriptionId: monthlySubscription(),
          appName: AppConstant.appName,
          appVersion: packageInfo.version,
          nextPage: () => const MyHomePage(),
        ),
        // initialRoute: Routes.homeScreen,
        getPages: appPages(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BackingTracksController _controller = Get.put(BackingTracksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: SafeArea(child: GetBuilder<BackingTracksController>(
          init: BackingTracksController(),
          builder: (controller) {
            return Container(
              margin: EdgeInsets.only(
                  left: 6.w, right: 6.w, top: 20.dp, bottom: 10.dp),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            margin: EdgeInsets.only(left: 10.dp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 13.dp, left: 8.dp),
                                    child: Text(
                                      Strings.drums,
                                      style:
                                          CustomTextStyles.whiteMediumTextStyle,
                                    )),
                                InkWell(
                                  child: Container(
                                    width: 60.dp,
                                    height: 60.dp,
                                    decoration: _controller.drumState
                                        ? BoxDecorations.selectedBoxDecoration()
                                        : BoxDecorations.defaultBoxDecoration(),
                                    child: Center(
                                      child: SizedBox(
                                        width: 35.dp,
                                        height: 35.dp,
                                        child: Image.asset(CustomImages.drums),
                                      ),
                                    ),
                                  ),
                                  onTap: () =>
                                      {_controller.updateDrumStateChallenges()},
                                )
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            margin: EdgeInsets.only(left: 10.dp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 8.dp),
                                    child: Text(
                                      Strings.bass,
                                      style:
                                          CustomTextStyles.whiteMediumTextStyle,
                                    )),
                                InkWell(
                                  child: Container(
                                    width: 60.dp,
                                    height: 60.dp,
                                    decoration: _controller.bassState
                                        ? BoxDecorations.selectedBoxDecoration()
                                        : BoxDecorations.defaultBoxDecoration(),
                                    child: Center(
                                      child: SizedBox(
                                        width: 35.dp,
                                        height: 35.dp,
                                        child: Image.asset(CustomImages.bass),
                                      ),
                                    ),
                                  ),
                                  onTap: () =>
                                      {_controller.updateBassStateChallenges()},
                                )
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            margin: EdgeInsets.only(right: 10.dp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 13.dp),
                                    child: Text(
                                      Strings.metronome,
                                      style:
                                          CustomTextStyles.whiteMediumTextStyle,
                                    )),
                                InkWell(
                                  child: Container(
                                    width: 60.dp,
                                    height: 60.dp,
                                    decoration: _controller.metronomsState
                                        ? BoxDecorations.selectedBoxDecoration()
                                        : BoxDecorations.defaultBoxDecoration(),
                                    child: Center(
                                      child: SizedBox(
                                        width: 35.dp,
                                        height: 35.dp,
                                        child:
                                            Image.asset(CustomImages.metronome),
                                      ),
                                    ),
                                  ),
                                  onTap: () => {
                                    _controller.updateMetronomsStateChallenges()
                                  },
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecorations.greyBoxDecoration(12),
                            margin: EdgeInsets.only(top: 25.dp, bottom: 50.dp),
                            child: PopulateMainCanvasList(
                                _controller.getDummyList())),
                        Positioned(
                            bottom: 22.dp,
                            right: 0.0,
                            left: 0.0,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Center(
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            width: 55.dp,
                                            height: 55.dp,
                                            margin:
                                                EdgeInsets.only(right: 15.dp),
                                            decoration: BoxDecorations
                                                .selectedBoxDecoration(),
                                            child: Center(
                                              child: SizedBox(
                                                width: 20.dp,
                                                height: 20.dp,
                                                child: Image.asset(
                                                    CustomImages.plus),
                                              ),
                                            ),
                                          ),
                                          onTap: () => {},
                                        ),
                                        InkWell(
                                          child: Container(
                                            width: 55.dp,
                                            height: 55.dp,
                                            margin:
                                                EdgeInsets.only(left: 15.dp),
                                            decoration: BoxDecorations
                                                .selectedBoxDecoration(),
                                            child: Center(
                                              child: SizedBox(
                                                width: 20.dp,
                                                height: 20.dp,
                                                child: Image.asset(
                                                    CustomImages.minus),
                                              ),
                                            ),
                                          ),
                                          onTap: () => {},
                                        )
                                      ],
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: SizedBox(
                            height: 210.dp,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20.dp, right: 20.dp, bottom: 10.dp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Strings.challenges,
                                        style: CustomTextStyles
                                            .whiteMediumTextStyle,
                                      ),
                                      Flexible(
                                          child: SizedBox(
                                              width: 70.dp,
                                              child: Switch(
                                                  value: _controller.challenges,
                                                  activeColor:
                                                      CustomColors.blackColor,
                                                  activeTrackColor: CustomColors
                                                      .greenToggleColor,
                                                  inactiveThumbColor:
                                                      CustomColors.blackColor,
                                                  inactiveTrackColor:
                                                      CustomColors.greyColor,
                                                  onChanged: (bool value) {
                                                    if (value) {
                                                      showDialog(context: context, builder:(BuildContext context){
                                                        return ChallengesDialog();
                                                      });
                                                      // showChallengesDialog(
                                                      //     context);
                                                    }
                                                    _controller
                                                        .updateChallenges(
                                                            value);
                                                  }))),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 1.dp),
                                  child: Text("BPM: 98",
                                      style: CustomTextStyles.white40TextStyle),
                                ),
                                SizedBox(
                                  width: 100.dp,
                                  height: 100.dp,
                                  child: Image.asset(CustomImages.playIcon),
                                )
                              ],
                            ),
                          )),
                    )
                  ])
                ],
              ),
            );
          },
        )));
  }
}
