import 'package:blocking_tracks/main.dart';
import 'package:blocking_tracks/routes/routes.dart';
import 'package:get/get.dart';

appPages() => [
  GetPage(name: Routes.homeScreen, page:()=> const MyHomePage())
];
