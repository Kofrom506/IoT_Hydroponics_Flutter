import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DataSCNPage extends StatelessWidget {
  const DataSCNPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        children: [
          CircleAvatar(),
          Text("Hi Enola",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          Icon(FontAwesomeIcons.bell),
        ],
      )
    ],);
  }
}
