import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/models/plant/plant.dart';
import 'package:flutter_hydroponics/widgets/capsule_with_overlay_text.dart';

class PlantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var plant = Plant.plantList.firstWhere((element) => element.id == 'bayam');
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          // Plant Image
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),

          // Overlay Container
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.4),
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Basil Plant',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(Ocimum Basilium)',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        child: Image.asset(
                          plant.imageName,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  plant.description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 16,
            child: CapsuleWithOverlayText(),
          ),
        ],
      ),
    );
  }
}
