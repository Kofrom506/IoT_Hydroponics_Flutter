import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/models/progress/progress.dart';
import 'package:flutter_hydroponics/models/progress/progress_helper.dart';
import 'package:flutter_hydroponics/screens/home/home_page_controller.dart';
import 'package:flutter_hydroponics/widgets/loading_widget.dart';
import 'package:flutter_hydroponics/widgets/plant_carousel.dart';
import 'package:flutter_hydroponics/widgets/rounded_rectangle_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart' hide Progress;

import '../../widgets/plant_card.dart';

class HomePage extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Progress?>>(
        future: ProgressHelper().listFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 10),
                          Text(
                            "Hi Evan,",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Icon(FontAwesomeIcons.bell),
                        ],
                      ),
                      SizedBox(height: 10),
                      const Text(
                        "Select your plants for Hydroponics!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: RoundedRectangleCard(
                        progress: snapshot.data!.first ??
                            Progress(
                                id: "",
                                plantId: "",
                                status: "",
                                sowingDate: DateTime.now(),
                                harvestingDate: DateTime.now(),
                                plantingDate: DateTime.now()),
                      )),
                      SizedBox(height: 10),
                      PlantCard(),
                      SizedBox(height: 20),
                      Text(
                        "Recommendation",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PlantCarousel(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return LoadingWidget();
          }
        });
  }
}
