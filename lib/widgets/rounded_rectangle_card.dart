import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/configs/configs.dart';
import 'package:flutter_hydroponics/models/plant/plant.dart';
import 'package:flutter_hydroponics/models/progress/progress.dart';

class RoundedRectangleCard extends StatelessWidget {
  RoundedRectangleCard({super.key, required this.progress});

  Progress progress;
  @override
  Widget build(BuildContext context) {
    Plant plant =
        Plant.plantList.firstWhere((element) => progress.plantId == element.id);
    var dayLeft = progress.harvestingDate.difference(DateTime.now()).inDays;

    var weeksLeft = (dayLeft / 7).ceil();
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: AspectRatio(
        aspectRatio: 4 / 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Configs.primaryColor,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayLeft.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Days',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18, // Text font size
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    child: VerticalDivider(color: Colors.white),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Cek Tanamanmu ${plant.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800)),
                        Text(
                            "Jangan Lupa Awasi Tanamanmu \n ${weeksLeft} Minggu lagi ${plant.name} Dapat dipanen",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
