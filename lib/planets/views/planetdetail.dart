import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:swapi/planets/views/widget/icon_text_contant.dart';
import '../controller/planetcontroller.dart';

class PlanetDetail extends StatefulWidget {
  const PlanetDetail({super.key});

  @override
  State<PlanetDetail> createState() => _PlanetDetailState();
}

class _PlanetDetailState extends State<PlanetDetail> {
  final planetController = Get.put(PlanetController());
  // String formattedNumber = planetController.formatNumber(planetController);

  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   planetController.res.value = planetController
  //       .formatNumber(planetController.AllList[planetController.i.value]['population']);
  //   planetController.intValue = int.parse(planetController.res.value).obs;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,

      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: planetController.planetList[planetController.i.value]['colors'],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              //here x icon widget
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 40,
                  color: Colors.white.withOpacity(0.9),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              // here other widget
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(planetController.planetList[planetController.i.value]["imagePath"],height: Get.height/3)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Text(planetController.AllList[planetController.i.value]['name'],
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w900,
                            fontSize: 34,
                            color: Colors.white.withOpacity(0.8),
                            letterSpacing: 1.2,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                    child: Text(
                      // "Population: ${planetController.AllList[planetController.i.value]["population"]}",
                      "Population: ${planetController.formattedNumberresult}",
                      style: TextStyle(
                        inherit: true,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                          height: 150,
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconContent(
                              icon: FontAwesomeIcons.earthAmericas,
                              label: "Orbital Period",
                              value: planetController.AllList[planetController.i.value]
                              ['orbital_period'])),
                      const Spacer(),
                      Container(
                        height: 150,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: IconContent(
                          icon: FontAwesomeIcons.circleNotch,
                          label: "Diameter",
                          value: planetController.AllList[planetController.i.value]
                          ['diameter'],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: 150,
                          width: Get.width * 0.85,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconContent(
                              icon: FontAwesomeIcons.houseFloodWater,
                              label: "Terrain",
                              value: planetController.AllList[planetController.i.value]
                              ['terrain']),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: 150,
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconContent(
                            icon: FontAwesomeIcons.water,
                            label: "Surface Water",
                            value: planetController.AllList[planetController.i.value]
                            ['surface_water'],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 150,
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconContent(
                            icon: FontAwesomeIcons.cloudSun,
                            label: "Climate",
                            value: planetController.AllList[planetController.i.value]
                            ['climate'],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: 150,
                          width: Get.width * 0.85,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: IconContent(
                              icon: FontAwesomeIcons.grav,
                              label: "Gravity",
                              value: planetController.AllList[planetController.i.value]
                              ['gravity']),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    ));
  }
}
