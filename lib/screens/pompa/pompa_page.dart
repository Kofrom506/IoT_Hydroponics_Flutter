import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class PompaPage extends StatelessWidget {
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Pump Control"),
              Spacer(),
              Icon(Icons.info)
            ],
          ),
          Divider(),
          HydroponicsControl(),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text('1.5Km'),
                    subtitle: Text('Distance'),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: ListTile(
                    title: Text('1:43:31'),
                    subtitle: Text('Duration'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


class HydroponicsControl extends StatefulWidget {
  @override
  _HydroponicsControlState createState() => _HydroponicsControlState();
}

class _HydroponicsControlState extends State<HydroponicsControl> {
  bool isHydroponicsOn = false;

  void toggleHydroponics() {
    setState(() {
      isHydroponicsOn = !isHydroponicsOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isHydroponicsOn ? 'Pump is On' : 'Pump is Off',
            style: TextStyle(fontSize: 24),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500, maxHeight: 500),
            child: FittedBox(
              fit: BoxFit.contain,
              child: IconButton(
                icon: Icon(isHydroponicsOn ? Icons.power_settings_new : Icons.power_off),
                iconSize: 150,

                onPressed: toggleHydroponics,
              ),
            ),
          ),
        ],
      ),
    );
  }
}