import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotwateringapp/Constructors/plant.dart';
import 'package:iotwateringapp/Pages/MyPlantDetails/Components/weather_info_pill.dart';
import 'package:iotwateringapp/Utils/colors.dart';
import 'package:iotwateringapp/services/api_service.dart';
import 'package:weather_icons/weather_icons.dart';

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage({super.key, required this.title, required this.plant});
  final Plant plant;
  final String title;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  @override
  Widget build(BuildContext context) {
    BoxShadow bshadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 4,
      spreadRadius: 5,
      offset: const Offset(0, -3),
    );
    BoxShadow bshadow2 = BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      blurRadius: 4,
      spreadRadius: 5,
      offset: const Offset(0, 1),
    );

    return Scaffold(
        backgroundColor: ThemeColors.oliveDune,
        appBar: AppBar(
          backgroundColor: ThemeColors.oliveDune,
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 32,
                color: ThemeColors.oliveLeaf,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Positioned(
              right: 0,
              left: 0,
              child: Image(
                image: AssetImage("assets/citrus/citrus_tree_courtyard.png"),
              ),
            ),
            const Positioned(
              top: 22,
              child: WeatherInfoPill(
                weatherInfoType: InfoType.humidity,
                pillColor: ThemeColors.oliveDune,
                secondaryColor: ThemeColors.citrusLeaf,
                humidity: 55, //TODO: Get real humidity
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 2.6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(16.0)
                          ),
                          boxShadow: [
                            bshadow
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            listItemWidget(
                                "Soil\nMoisture", "32", WeatherIcons.humidity),
                            listItemWidget(
                                "Air\nTemperature", "21", WeatherIcons.celsius),
                            listItemWidget("Water in\napprox.", "4h",
                                FontAwesomeIcons.water),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: MediaQuery.of(context).size.height / 1.35,
                child: Container(
                    height: 70,
                    width: 240,
                    decoration: BoxDecoration(
                        boxShadow: [
                          bshadow2
                        ],
                        borderRadius: BorderRadius.circular(32.0),
                        color: Colors.greenAccent),
                    child: TextButton(
                      onPressed: () async {
                        ApiService apiservice = ApiService();
                        await apiservice.startWaterPump(widget.plant);
                      },
                      child: const Text(
                        "Water now",
                        style: TextStyle(fontSize: 22),
                      ),
                    ))),
          ],
        ));
  }

  Widget listItemWidget(String txt1, String txt2, IconData iconData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              txt1,
              style: const TextStyle(
                  fontSize: 18,
                  color: ThemeColors.oliveLeaf,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(txt2,
                    style: const TextStyle(
                        fontSize: 28, color: ThemeColors.oliveLeaf)),
              ),
              Padding(
                padding: iconData == FontAwesomeIcons.water
                    ? const EdgeInsets.only(bottom: 0)
                    : const EdgeInsets.only(bottom: 12),
                child: Icon(
                  iconData,
                  color: ThemeColors.oliveLeaf,
                  size: 42,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
