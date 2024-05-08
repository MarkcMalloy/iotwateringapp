import 'package:flutter/material.dart';
import 'package:iotwateringapp/Constructors/plant.dart';
import 'package:iotwateringapp/Pages/MyPlantDetails/Components/data_info_pill.dart';
import 'package:iotwateringapp/Pages/MyPlants/my_plant_card.dart';
import 'package:iotwateringapp/Utils/colors.dart';

class MyPlantsPage extends StatefulWidget {
  @override
  _MyPlantsPageState createState() => _MyPlantsPageState();
}

class _MyPlantsPageState extends State<MyPlantsPage> {
  List<Plant> myHerbs = [
    Plant('assets/citrus/citrus_tree_tile.png',
        'assets/citrus/citrus_tree_courtyard.png', 'Citrus Tree', 1),
    Plant('assets/herbs/herbs_tile.png',
        'assets/citrus/citrus_tree_courtyard.png', 'Thyme', 2),
  ];

  @override
  Widget build(BuildContext context) {
    BoxShadow bshadow = BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 4,
      spreadRadius: 5,
      offset: const Offset(0, -1),
    );
    const subtitle = TextStyle(
        fontSize: 24,
        color: ThemeColors.oliveLeaf,
        fontWeight: FontWeight.bold);
    return Scaffold(
        backgroundColor: ThemeColors.oliveDune,
        appBar: AppBar(
          backgroundColor: ThemeColors.oliveDune,
          title: const Text(
            "Dashboard",
            style: TextStyle(
                fontSize: 32,
                color: ThemeColors.oliveLeaf,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  "My Device Data",
                  style: subtitle,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 380,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [bshadow],
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DataInfoPill(dataType: "battery", dataValue: "charging"),
                      DataInfoPill(dataType: "humidity", dataValue: "55%"),
                      DataInfoPill(dataType: "temperature", dataValue: "25C"),
                      DataInfoPill(dataType: "pump 1 status", dataValue: "Off"),
                      DataInfoPill(dataType: "pump 2 status", dataValue: "Off")
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  "My Plants",
                  style: subtitle,
                ),
              ),
              cardBuilder(myHerbs)
            ],
          ),
        ));
  }

  Widget gridTitleText(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 28,
            color: ThemeColors.oliveLeaf,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget cardBuilder(List<Plant> plants) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: plants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: PlantCard(plant: plants[index]),
        );
      },
    );
  }
}
