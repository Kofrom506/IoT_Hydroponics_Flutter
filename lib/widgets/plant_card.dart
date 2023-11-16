import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/models/plant.dart';


// class PlantCard extends StatelessWidget {
//   final Plant plant;
//
//   PlantCard({required this.plant, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Card(
//       // color: pokemon.backgroundColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             right: -20,
//             bottom: -20,
//             child: Opacity(
//               opacity: 0.2,
//               child: Image.asset(
//                 'assets/pokeball.png',
//                 width: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(plant.name,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.04,
//                             fontWeight: FontWeight.bold)),
//                     for (var type in plant.types)
//                       Column(
//                         children: [
//                           SizedBox(height: screenHeight * 0.005),
//                           // CapsulePokeType(type),
//                         ],
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png",
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
