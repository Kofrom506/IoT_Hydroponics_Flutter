import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/configs/configs.dart';
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
                      fontWeight: FontWeight.bold,
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
                  fontWeight: FontWeight.bold,
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
              PlantCarousel()
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedRectangleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(12.0),
      ),
      child: AspectRatio(
        aspectRatio: 4 / 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Configs.primaryColor,
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '14',
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
                    padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: VerticalDivider(color: Colors.white),
                  ),
                  Text("Check your Basil plants",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          // Plant Image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://example.com/your_plant_image.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
          ),

          // Overlay Container
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
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
          ),
          Positioned(
            bottom: 8,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CapsuleWithOverlayText()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlantCarousel extends StatelessWidget {
  final List<String> plantImages = [
    'assets/plants/1.png',
    'assets/plants/2.png',
    'assets/plants/3.png',
    'assets/plants/4.png',
    'assets/plants/5.png',
    'assets/plants/6.png',
    'assets/plants/7.png',
    'assets/plants/8.png',
    'assets/plants/9.png',
    // Add more plant image URLs here
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width ;

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.5,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        autoPlay: false,
      ),
      items: plantImages.map((imageURL) {
        return Stack(
          children: [Container(
            width: double.infinity,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child:  Image.asset(
                    imageURL,
                    
                    width: screenWidth * 0.1,
                    fit:BoxFit.fitWidth
                ),
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
                    plantImages,
                    style: TextStyle(
                      color: Colors.black,
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
            ),
        ]
        );
      }).toList(),
    );
  }
}

class CapsuleWithOverlayText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Adjust the width as needed
      height: 50, // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), // Half of the height for a capsule shape
        color: Colors.white.withOpacity(0.2),
        // Background color of the capsule
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            'See Details →',
            style: TextStyle(
              color: Configs.primaryColor,
              fontSize: 15,

            ),
          ),
        ],
      ),
    );
  }
}
