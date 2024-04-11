import 'package:flutter/material.dart';
import 'package:iotwateringapp/Constructors/plant.dart';
import 'package:iotwateringapp/Pages/MyPlants/my_plant_card.dart';
import 'package:iotwateringapp/Utils/colors.dart';

class MyPlantsPage extends StatefulWidget {
  @override
  _MyPlantsPageState createState() => _MyPlantsPageState();
}

class _MyPlantsPageState extends State<MyPlantsPage> {
  List<Plant> myTrees = [
    Plant('assets/olive/olive_tree_courtyard_tile.png', 'Olives'),
    Plant('assets/citrus/citrus_tree_tile.png', 'Citrus'),
  ];

  List<Plant> myHerbs = [
    Plant('assets/herbs/herbs_tile.png', 'Herbs'),
  ];

  List<Plant> myGardens = [
    Plant('assets/garden/my_garden_tile_1.png', 'My garden')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.oliveDune,
      appBar: AppBar(
        backgroundColor: ThemeColors.oliveDune,
        title: const Text(
          "My Plants",
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
            gridTitleText("From the orchyard"),
            cardBuilder(myTrees),
            gridTitleText("From the garden"),
            cardBuilder(myGardens),
            gridTitleText("From the kitchen"),
            cardBuilder(myHerbs)
          ],
        ),
      )
    );
  }

  Widget gridTitleText(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(txt,
        style: const TextStyle(
            fontSize: 28,
            color: ThemeColors.oliveLeaf,
            fontWeight: FontWeight.w400),
      ),
    );
  }
  
  Widget cardBuilder(List<Plant> plants){
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: plants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return PlantCard(plant: plants[index]);
      },
    );
  }
}
