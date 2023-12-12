import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/functions/date_parser.dart';
import 'package:flutter_hydroponics/models/plant/plant.dart';
import 'package:flutter_hydroponics/models/progress/progress.dart';
import 'package:flutter_hydroponics/models/progress/progress_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressPage extends StatelessWidget {
  // const LiveViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Progress List",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon:
                        Icon(FontAwesomeIcons.search, color: Colors.black),
                    hintText: "Search Image By Keyword",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Expanded(child: PlantList()),
            // Expanded(
            //   child: GridView.count(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 3,
            //       children: List.generate(100, (index) {
            //         return Card(
            //           child:  Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Image.asset(
            //                 'assets/halte_teknik_maps.png',
            //                 width: double.infinity,
            //                 height: 120,
            //                 fit: BoxFit.cover,
            //               ),
            //               Text("21 Agustus 2023"),
            //               Text("21 Agustus 2023")
            //             ],
            //           ),
            //
            //         );
            //       })),
            // ),
          ],
        ),

        // ListView(children: [Container()],)
        //     MasonryGridView.count(
        // crossAxisCount: 4,
        // mainAxisSpacing: 4,
        // crossAxisSpacing: 4,
        // itemBuilder: (context, index) {
        //   return Container(height: 30,color: Configs.color2);
        // },
        // )
      ),
    );
  }
}

class PlantList extends StatelessWidget {
  final List<Plant> plants = Plant.plantList;

  // plantList PlantList(this.plants);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Progress?>>(
        future: ProgressHelper().listFuture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Progress?> data = snapshot.data?.toList() ?? [];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Progress dates = data[index]!;
                Plant plant =
                    plants.firstWhere((element) => element.id == dates.plantId);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(plant.imageName),
                  ),
                  title: Text('Name: ${plant.name}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('ID: ${dates.id}'),
                      Text('Semai : ${DateParser.parseDate(dates.sowingDate)}'),
                      Text(
                          'Tanam : ${DateParser.parseDate(dates.plantingDate)}'),
                      Text(
                          'Panen : ${DateParser.parseDate(dates.harvestingDate)}'),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        });
  }
}
