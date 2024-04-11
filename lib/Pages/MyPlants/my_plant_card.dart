import 'package:flutter/material.dart';
import 'package:iotwateringapp/Constructors/plant.dart';
import 'package:iotwateringapp/Pages/MyPlantDetails/citrus_tree_page.dart';
import 'package:iotwateringapp/Pages/MyPlantDetails/olive_tree_page.dart';
import 'package:iotwateringapp/Utils/colors.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        switch(plant.plantName){
          case "Olives":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OliveTreeDetailsPage(title: "My Olives",)),
            );
          case "Citrus":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CitrusTreeDetailsPage(title: "My Citrus",)),
            );
        }
      },
      child:  Card(
        color: ThemeColors.oliveDune,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                plant.plantImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                plant.plantName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
