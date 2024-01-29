import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:swapi/planets/views/planetslist.dart';

import '../controller/planetcontroller.dart';
import 'no_internet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final planetController = Get.put(PlanetController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planetController.goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/star_wars.png'),
            ),
            Expanded(child: Lottie.asset('assets/images/animation.json')),
          ],
        ),
      ),
    );
  }
}
