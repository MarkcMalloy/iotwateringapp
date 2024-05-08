import 'package:flutter/material.dart';
import 'package:iotwateringapp/Constructors/plant.dart';
import 'package:iotwateringapp/Pages/MyPlantDetails/plant_details_page.dart';
import 'package:iotwateringapp/Utils/colors.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        switch(plant.plantName){
          case "Citrus Tree":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlantDetailsPage(title: "My Citrus",plant: plant)),
            );
          case "Thyme":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlantDetailsPage(title: "My Thyme", plant: plant,)),
            );
        }
      },
      child:  Card(
        color: ThemeColors.oliveDune,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Set the radius here
                child: Image.asset(
                  plant.plantCardImage,
                  fit: BoxFit.cover,
                ),
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
