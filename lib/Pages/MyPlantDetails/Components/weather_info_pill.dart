import 'package:flutter/material.dart';
import 'package:iotwateringapp/Utils/colors.dart';

enum InfoType { humidity, temperature, wind }

class WeatherInfoPill extends StatelessWidget {
  final int humidity;
  final InfoType weatherInfoType;
  final Color pillColor;
  final Color secondaryColor;
  const WeatherInfoPill(
      {Key? key,
      required this.weatherInfoType,
      required this.pillColor,
      required this.secondaryColor,
      required this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var oliveLeaf = Color(0xff4b573a);
    const mainValueTextStyle = TextStyle(
        fontSize: 32,
        color: ThemeColors.oliveLeaf,
        fontWeight: FontWeight.bold);
    const secondaryValueTextStyle = TextStyle(
        fontSize: 22,
        color: ThemeColors.oliveLeaf,
        fontWeight: FontWeight.bold);

    return Container(
      height: 70,
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: pillColor.withOpacity(0.95)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weatherInfoType.name,
                  style: secondaryValueTextStyle,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: oliveLeaf),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Text(
              //TODO: Get air humidity
              "28%",
              style: mainValueTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
