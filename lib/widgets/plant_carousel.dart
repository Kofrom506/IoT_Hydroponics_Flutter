import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/functions/date_parser.dart';
import 'package:flutter_hydroponics/functions/loading_function.dart';
import 'package:flutter_hydroponics/models/plant/plant.dart';
import 'package:flutter_hydroponics/models/progress/progress_helper.dart';
import 'package:flutter_hydroponics/widgets/loading_widget.dart';

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
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return DataModal(
                      plantData: plant,
                    );
                  })
            },
            child: Card(
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Stack(
                  children: [
                    Image.asset(plant.imageName, fit: BoxFit.fitWidth),
                    Container(
                      color: Color.fromRGBO(133, 147, 99, 0.8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plant.name,
                              style: TextStyle(
                                color: Colors.white,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DataModal extends StatelessWidget {
  final Plant plantData;

  DataModal({required this.plantData});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Kamu Ingin Menanam Tanaman ini?"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Tanaman : ${plantData.name}'),
          const SizedBox(height: 4),
          Text(
            'Tanggal dan Waktu Penanaman: ${DateParser.parse(DateTime.now())}',
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () async {
              try {
                LoadingFunction.showLoadingDialog(context);
                await ProgressHelper().write(plant: plantData);
                LoadingFunction.closeLoadingDialog(context);
                Navigator.of(context).pop();
              } catch (e) {
                throw (e);
              }
            },
            child: Text("Tanam")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Batal"))
      ],
    );
  }
}
