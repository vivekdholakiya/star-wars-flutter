import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:swapi/planets/controller/planetcontroller.dart';
import 'package:swapi/planets/views/planetdetail.dart';

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({super.key});

  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
  final planetController = Get.put(PlanetController());
  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    planetController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 64),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Star Wars",
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text: "Planets",
                    style: TextStyle(
                      fontFamily: 'WorkSans',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.1,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: Get.height - 150,
              child: PageView(
                children: [
                  for (int i = 0; i < planetController.AllList.length; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedBuilder(
                              animation: planetController.pageController,
                              builder: (context, child) {
                                return Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: ClipPath(
                                        // clipper: CharacterCardBackgroundClipper(),
                                        child: Container(
                                          height: Get.height * 0.55,
                                          width: Get.width * 0.9,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: planetController.planetList[i]
                                                    ['colors'],
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                              ),
                                              borderRadius: BorderRadius.circular(20)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 48.0, bottom: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(planetController.AllList[i]['name'],
                                              style: TextStyle(
                                                fontFamily: 'WorkSans',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 34,
                                                color: Colors.white.withOpacity(0.8),
                                                letterSpacing: 1.2,
                                              )),
                                          InkWell(
                                            onTap: () {
                                              planetController.i.value = i;
                                              print(
                                                  "planetList langth ${planetController.planetList.length}");
                                              print(
                                                  "population---> ${planetController.AllList[planetController.i.value]["population"]}");
                                              planetController.number
                                                  .value = int.parse(planetController
                                                      .AllList[planetController.i.value]
                                                  ["population"]);
                                              planetController
                                                      .formattedNumberresult.value =
                                                  planetController.formatNumber(
                                                      planetController.number.value);
                                              print(
                                                  "Formatted number: ${planetController.formattedNumberresult}");
                                              Get.to(PlanetDetail());

                                              // print("pci ${planetController.i}");
                                            },
                                            child: Text(
                                              'Tap to see details',
                                              style: TextStyle(
                                                inherit: true,
                                                fontFamily: 'WorkSans',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 24,
                                                color: Colors.white.withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  String formatNumber(int number) {
    NumberFormat formatter = NumberFormat.compact();
    return formatter.format(number);
  }
}

// class CharacterCardBackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path clippedPath = Path();
//     double curveDistance = 40;
//
//     clippedPath.moveTo(0, size.height * 0.4);
//     clippedPath.lineTo(0, size.height - curveDistance);
//     clippedPath.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
//     clippedPath.lineTo(size.width - curveDistance, size.height);
//     clippedPath.quadraticBezierTo(
//         size.width + 1, size.height - 1, size.width, size.height - curveDistance);
//     clippedPath.lineTo(size.width, 0 + curveDistance);
//     clippedPath.quadraticBezierTo(
//         size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3);
//     clippedPath.lineTo(curveDistance, size.height * 0.29);
//     clippedPath.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);
//     return clippedPath;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
//
// }
