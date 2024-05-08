import 'package:flutter/material.dart';
import 'package:iotwateringapp/Utils/colors.dart';

class DataInfoPill extends StatelessWidget {
  final String dataType;
  final String dataValue;
  const DataInfoPill(
      {Key? key, required this.dataType, required this.dataValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var oliveLeaf = const Color(0xff4b573a);
    const secondaryValueTextStyle = TextStyle(
        fontSize: 20,
        color: ThemeColors.oliveLeaf,
        fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Text(
                dataType,
                style: secondaryValueTextStyle,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: oliveLeaf
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                dataValue,
                style: secondaryValueTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
