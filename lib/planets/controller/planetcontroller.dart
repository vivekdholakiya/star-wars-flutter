import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:swapi/planets/views/no_internet.dart';

import '../views/planetslist.dart';

class PlanetController extends GetxController {

  final PageController  pageController = PageController();
  int activePage = 0;
  RxList AllList = [].obs;
  RxList planetList = [
    {
      'name': "Tatooine",
        'imagePath': "assets/images/Tatooine.webp",
      'colors': [const Color(0xff659999), const Color(0xfff4791f)]
    },
    {
      'name': "Alderaan",
      'imagePath': "assets/images/alderaan_planet.png",
      'colors': [const Color(0xffbdc3c7), const Color(0xff2c3e50)]
    },
    {
      'name': "Yavin IV",
      'imagePath': "assets/images/yavin_planet.png",
      'colors': [const Color(0xff2C5364), const Color(0xff0F2027)]
    },
    {
      'name': "Hoth",
      'imagePath': "assets/images/hoth_planet.png",
      'colors': [const Color(0xff525252), const Color(0xff3d72b4)]
    },
  ].obs;

  RxString url = "https://swapi.dev/api/planets".obs;

   goToHome() async {

    await Future.delayed(const Duration(seconds: 3));
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      Get.to(PlanetScreen());
    } else {
      Get.to(NoInternet());
    }
  }


  getData() async {
    http.Response response = await http.get(Uri.parse(url.value));
    if (response.statusCode == 200) {
      // print(response.body);
      var res =jsonDecode(response.body);
      AllList.value=(res["results"]);
      print(AllList);
    } else {
      debugPrint('${response.statusCode}');
    }
  }


}
