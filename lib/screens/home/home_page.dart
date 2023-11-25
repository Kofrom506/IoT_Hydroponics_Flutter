import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/configs/configs.dart';
import 'package:flutter_hydroponics/models/plant.dart';
import 'package:flutter_hydroponics/widgets/date_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  // DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  // DataSnapshot dataSnapshot = await databaseReference.child('your_path').once();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Center(child: RoundedRectangleCard()),
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
  }
}







