import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/models/plant.dart';

class PlantCarousel extends StatelessWidget {
  final List<Plant> plantList = Plant.plantList;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.5,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        autoPlay: false,
      ),
      items: plantList.map((plant) {
        return Stack(children: [
          Container(
            width: double.infinity,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(plant.imageName,
                    width: screenWidth * 0.1, fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  plant.description,
                  style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ]);
      }).toList(),
    );
  }
}