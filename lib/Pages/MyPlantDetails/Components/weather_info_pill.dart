import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

enum InfoType { humidity, temperature, wind }

class WeatherInfoPill extends StatelessWidget {
  final InfoType weatherInfoType;
  final Color pillColor;
  final Color secondaryColor;
  const WeatherInfoPill({Key? key, required this.weatherInfoType, required this.pillColor, required this.secondaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var oliveLeaf = Color(0xff4b573a);
    var mainValueTextStyle = TextStyle(fontSize: 32, color: secondaryColor, fontWeight: FontWeight.w400);
    var secondaryValueTextStyle = TextStyle(fontSize: 22, color: secondaryColor, fontWeight: FontWeight.w600);

    return Container(
      height: 70,
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0), color: pillColor.withOpacity(0.8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 4,
            child: Text(
              "28",
              style: mainValueTextStyle,
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(child: infoPillIcon(),padding: EdgeInsets.only(bottom: 22),)
          ),
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: oliveLeaf),
                ),
                Text(
                  weatherInfoType.name,
                  style: secondaryValueTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color infoPillColor(){
    switch (weatherInfoType){
      case InfoType.humidity:
        return Colors.blueAccent.withOpacity(0.4);
      case InfoType.temperature:
        return Colors.redAccent.withOpacity(0.4);
      case InfoType.wind:
        return Colors.grey.withOpacity(0.5);
    }
  }

  Widget infoPillIcon(){
    switch (weatherInfoType){
      case InfoType.humidity:
        return Icon(WeatherIcons.humidity, color: infoPillColor(), size: 42,);
      case InfoType.temperature:
        return Icon(Icons.sunny, color: infoPillColor());
      case InfoType.wind:
        return Icon(Icons.wind_power_rounded, color: infoPillColor());
    }
  }
}
