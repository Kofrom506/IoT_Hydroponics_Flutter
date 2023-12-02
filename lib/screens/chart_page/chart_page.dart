// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hydroponics/configs/configs.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Color> gradientColors = [
    Configs.primaryColor,
    Configs.secondaryColor,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Greenhouse A",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 15,),
          // BarChart(
          //   BarChartData(
          //     alignment: BarChartAlignment.spaceAround,
          //     maxY: 10,
          //     barGroups: [
          //       BarChartGroupData(
          //         x: 0,
          //         barRods: [
          //           BarChartRodData(
          //
          //             color: Colors.blue, toY: 5,
          //           ),
          //         ],
          //       ),
          //       BarChartGroupData(
          //         x: 1,
          //         barRods: [
          //           BarChartRodData(
          //             color: Colors.green, toY: 5,
          //           ),
          //         ],
          //       ),
          //       BarChartGroupData(
          //         x: 2,
          //         barRods: [
          //           BarChartRodData(
          //             color: Colors.red, toY: 3,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

              SizedBox(height: 15,),
              Text("Grafik pH",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,)),
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: LineChart(
                      showAvg ? avgData() : mainData(),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 34,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showAvg = !showAvg;
                        });
                      },
                      child: Text(
                        'avg',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                          showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text("Grafik Water Temperature",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,)),
              // Stack(
              //   children: <Widget>[
              //     AspectRatio(
              //       aspectRatio: 1.70,
              //       child: LineChart(
              //         showAvg ? avgData() : mainData(),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 60,
              //       height: 34,
              //       child: TextButton(
              //         onPressed: () {
              //           setState(() {
              //             showAvg = !showAvg;
              //           });
              //         },
              //         child: Text(
              //           'avg',
              //           style: TextStyle(
              //             fontSize: 12,
              //             color:
              //             showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 15,),
              Text("Grafik EC",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,)),
              // Stack(
              //   children: <Widget>[
              //     AspectRatio(
              //       aspectRatio: 1.70,
              //       child: LineChart(
              //         showAvg ? avgData() : mainData(),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 60,
              //       height: 34,
              //       child: TextButton(
              //         onPressed: () {
              //           setState(() {
              //             showAvg = !showAvg;
              //           });
              //         },
              //         child: Text(
              //           'avg',
              //           style: TextStyle(
              //             fontSize: 12,
              //             color:
              //             showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 15,),
              Text("Grafik Water Level",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,)),
              // Stack(
              //   children: <Widget>[
              //     AspectRatio(
              //       aspectRatio: 1.70,
              //       child: LineChart(
              //         showAvg ? avgData() : mainData(),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 60,
              //       height: 34,
              //       child: TextButton(
              //         onPressed: () {
              //           setState(() {
              //             showAvg = !showAvg;
              //           });
              //         },
              //         child: Text(
              //           'avg',
              //           style: TextStyle(
              //             fontSize: 12,
              //             color:
              //             showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // LineChart(LineChartData(
              //     minX: 0,
              //     maxX: 11,
              //     minY: 0,
              //     maxY: 6,
              //     lineBarsData: [
              //       LineChartBarData(
              //           spots: [
              //             FlSpot(0, 3),
              //             FlSpot(0, 5),
              //             FlSpot(0, 5),
              //
              //           ]
              //       )
              //     ]
              //
              // )

            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Configs.color1,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Configs.color3,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// class LineChartWidget extends StatelessWidget {
//   final List<PricePoint> points;
//
//   const LineChartWidget(this.points, {Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 2,
//       child: LineChart(
//         LineChartData(
//           lineBarsData: [
//             LineChartBarData(
//               spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
//               isCurved: false,
//               // dotData: FlDotData(
//               //   show: false,
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }