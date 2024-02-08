import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:swapi/planets/views/no_internet.dart';

import '../views/planetslist.dart';

class PlanetController extends GetxController {

  final PageController  pageController = PageController();
  RxInt i = 0.obs;
  RxList AllList = [].obs;
  RxList planetList = [
    {
      'name': "Tatooine",
        'imagePath': "assets/images/Tatooine.webp",
      'colors': [const Color(0xff659999), const Color(0xfff4791f)],
      'color' : 659999
    },
    {
      'name': "Alderaan",
      'imagePath': "assets/images/Alderaan.png",
      'colors': [const Color(0xffbdc3c7), const Color(0xff2c3e50)]
    },
    {
      'name': "Yavin IV",
      'imagePath': "assets/images/Yavin.png",
      'colors': [const Color(0xff2C5364), const Color(0xff0F2027)]
    },
    {
      'name': "Hoth",
      'imagePath': "assets/images/Hoth.png",
      'colors': [const Color(0xff525252), const Color(0xff3d72b4)]
    },
    {
      'name': "Dagobah",
      'imagePath': "assets/images/Degobh.png",
      'colors': [const Color(0xff6d8b45), const Color(0xff33342f)]
    },
    {
      'name': "Bespin",
      'imagePath': "assets/images/bespin.png",
      'colors': [const Color(0xffec8f4c), const Color(0xffde9c46)]
    },
    {
      'name': "Endor",
      'imagePath': "assets/images/Endor.png",
      'colors': [const Color(0xffd9bcb8), const Color(0xff463b45)]
    },
    {
      'name': "Naboo",
      'imagePath': "assets/images/Naboo.png",
      'colors': [const Color(0xffaed1d7), const Color(0xff2c3a3d)]
    },
    {
      'name': "Coruscant",
      'imagePath': "assets/images/Coruscant.png",
      'colors': [const Color(0xff3abbf4), const Color(0xff0b1014)]
    },
    {
      'name': "kamino",
      'imagePath': "assets/images/Kamino.png",
      'colors': [const Color(0xff525252), const Color(0xff3d72b4)]
    },
  ].obs;

  RxString url = "https://swapi.dev/api/planets".obs;

   goToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      Get.offAll(PlanetScreen());
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
   RxString res = "".obs;
  late RxInt intValue;

  String formatNumber(int number) {
    NumberFormat formatter = NumberFormat.compact();
    return formatter.format(number);
  }
  RxInt number =0.obs;
  RxString formattedNumberresult = "".obs;


}
