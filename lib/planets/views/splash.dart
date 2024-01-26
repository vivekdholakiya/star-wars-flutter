import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';

import 'no_internet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
            Expanded(
                child: Lottie.asset('assets/images/animation.json')),
          ],
        ),
      ),
    );
  }

  void getData() async {
    await Future.delayed(const Duration(seconds: 3));

    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      Text("inter net conected");
    } else {
      if (!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const NoInternet();
      }));
    }
  }
}