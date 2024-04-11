import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotwateringapp/Pages/MyPlantDetails/Components/weather_info_pill.dart';
import 'package:iotwateringapp/Utils/colors.dart';
import 'package:weather_icons/weather_icons.dart';

class CitrusTreeDetailsPage extends StatefulWidget {
  const CitrusTreeDetailsPage({super.key, required this.title});
  final String title;

  @override
  State<CitrusTreeDetailsPage> createState() => _CitrusTreeDetailsPageState();
}

class _CitrusTreeDetailsPageState extends State<CitrusTreeDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.oliveDune,
        appBar: AppBar(
          backgroundColor: ThemeColors.oliveDune,
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 32, color: ThemeColors.oliveLeaf, fontWeight: FontWeight.bold),
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
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 4,
                              spreadRadius: 5,
                              offset: const Offset(0, -3),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            olive_list_item(
                                "Soil\nHumidity", "32", WeatherIcons.humidity),
                            olive_list_item("Soil\nTemperature", "21",
                                WeatherIcons.celsius),
                            olive_list_item("Last\nwatered", "113h",
                                WeatherIcons.raindrops),
                            olive_list_item(
                                "Water\nin", "19h", FontAwesomeIcons.water),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }

  Widget olive_list_item(String txt1, String txt2, IconData iconData) {
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
                  fontSize: 18, color: ThemeColors.oliveLeaf, fontWeight: FontWeight.w600),
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
                    style: const TextStyle(fontSize: 28, color: ThemeColors.oliveLeaf)),
              ),
              Padding(
                padding: iconData == FontAwesomeIcons.water ? const EdgeInsets.only(bottom: 0) : const EdgeInsets.only(bottom: 12),
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
