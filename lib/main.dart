import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/configs/configs.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.cameraRetro,
    FontAwesomeIcons.bus,
    FontAwesomeIcons.lineChart,
    FontAwesomeIcons.infoCircle,
  ];
  Widget? getPage() {
    switch(_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return Placeholder();
      case 2:
        return Placeholder();
      case 3:
        return Placeholder();
      case 4:
        return Placeholder();
      default:
        return Placeholder();
    }
    // return HomePage();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(
          builder: (context) {
            return Scaffold(
                body: getPage(),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _icons.asMap().entries.map((entry) {
                        final index = entry.key;
                        final icon = entry.value;

                        return GestureDetector(
                          onTap: () {
                            if(index!=2) {
                              setState(() {
                                _currentIndex = index;
                              });
                            }
                            else{
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Placeholder());
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                            decoration: index == 2
                                ? BoxDecoration(
                                shape: BoxShape.circle,
                                color: Configs.primaryColor)
                                : null,
                            child: index == 2 ? Icon(
                                icon,
                                size: 25.0,
                                color: Colors.white
                            ) : Icon(
                              icon,
                              size: 25.0,
                              color: _currentIndex == index
                                  ? Configs.primaryColor
                                  : Configs.navBarColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ));
          }
      ),
    );
  }
}