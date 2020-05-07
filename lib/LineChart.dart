import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';

// ignore: must_be_immutable
class LineChart1 extends StatefulWidget {
  DateTime firstCase = DateTime(
      2020,
      int.parse(dates[0].toString().split('/')[0]),
      int.parse(dates[0].toString().split('/')[1]));

  var timeline = 0;
  List<FlSpot> allSpots = [
    for (int i = 0; i < days.length; i++)
      FlSpot(double.parse(days[i].toString()), double.parse(datetotcase[i])),
  ];

  List<FlSpot> allSpots2 = [
    for (int i = 0; i < days.length; i++)
      FlSpot(double.parse(days[i].toString()), double.parse(datetotrecov[i])),
  ];

  List<FlSpot> allSpots3 = [
    for (int i = 0; i < days.length; i++)
      FlSpot(double.parse(days[i].toString()), double.parse(datetotdeath[i])),
  ];
  var intervals;
  LineChart1(this.allSpots, this.allSpots2, this.allSpots3, this.intervals,
      this.firstCase, this.timeline);

  @override
  _LineChart1State createState() => _LineChart1State();
}

class _LineChart1State extends State<LineChart1> {
  final List<int> showIndexes = const [0, 19];
  bool _isSwitched1 = false;
  bool _isSwitched2 = true;
  bool _isSwitched3 = false;

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
//          showingIndicators: showIndexes,
        spots: [
          if (_isSwitched1)
            for (int i = 0; i < widget.timeline;i++) widget.allSpots[i]
          else if(_isSwitched2)
            for (int i = widget.timeline-30; i < widget.timeline; i++) widget.allSpots[i]
          else if(_isSwitched3)
              for (int i = widget.timeline-15; i < widget.timeline; i++) widget.allSpots[i]
            else
              for (int i = 0; i < widget.timeline; i++) widget.allSpots[i]
        ],
        isCurved: true,
        barWidth: 2,
        shadow: const Shadow(
          blurRadius: 4,
          color: Colors.black,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            Colors.orangeAccent
//              const Color(0xff12c2e9).withOpacity(0.4),
//              const Color(0xffc471ed).withOpacity(0.4),
//              const Color(0xfff64f59).withOpacity(0.4),
          ],
        ),
        dotData: FlDotData(
          show: true,
          dotSize: 2,
          strokeWidth: 1,
        ),
//          colors: [
//            const Color(0xff12c2e9),
//            const Color(0xffc471ed),
//            const Color(0xfff64f59),
//          ],
//          colorStops: [
//            0.1,
//            0.4,
//            0.9
//          ]
      ),
      LineChartBarData(
//        showingIndicators: showIndexes,
        spots: [
          if (_isSwitched1)
            for (int i = 0; i < widget.timeline;i++) widget.allSpots2[i]
          else if(_isSwitched2)
            for (int i = widget.timeline-30; i < widget.timeline; i++) widget.allSpots2[i]
          else if(_isSwitched3)
              for (int i = widget.timeline-15; i < widget.timeline; i++) widget.allSpots2[i]
            else
              for (int i = 0; i < widget.timeline; i++) widget.allSpots2[i]
        ],
        isCurved: true,
        barWidth: 2,
        shadow: const Shadow(
          blurRadius: 4,
          color: Colors.black,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            Colors.lightGreen
//              const Color(0xfea8f059).withOpacity(0.8),
//              const Color(0xffc471ed).withOpacity(0.4),
//            const Color(0xfff64f59).withOpacity(0.4),
          ],
        ),
        dotData: FlDotData(
          show: false,
          dotSize: 2,
          strokeWidth: 2,
        ),
//          colors: [
//            const Color(0xff12c2e9),
//            const Color(0xffc471ed),
//            const Color(0xfff64f59),
//          ],
//          colorStops: [
//            0.1,
//            0.4,
//            0.9
//          ]
      ),
      LineChartBarData(
//        showingIndicators: showIndexes,
        spots: [
          if (_isSwitched1)
            for (int i = 0; i < widget.timeline;i++) widget.allSpots3[i]
          else if(_isSwitched2)
            for (int i = widget.timeline-30; i < widget.timeline; i++) widget.allSpots3[i]
          else if(_isSwitched3)
              for (int i = widget.timeline-15; i < widget.timeline; i++) widget.allSpots3[i]
            else
              for (int i = 0; i < widget.timeline; i++) widget.allSpots3[i]
        ],
        isCurved: true,
        barWidth: 2,
        shadow: const Shadow(
          blurRadius: 2,
          color: Colors.black,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            Colors.purple
//            const Color(0xfea8f059).withOpacity(0.8),
//            const Color(0xffa30fff).withOpacity(1),
//            const Color(0xfff64f59).withOpacity(0.4),
          ],
        ),
        dotData: FlDotData(
          show: false,
          dotSize: 2,
          strokeWidth: 2,
        ),
//          colors: [
//            const Color(0xff12c2e9),
//            const Color(0xffc471ed),
//            const Color(0xfff64f59),
//          ],
//          colorStops: [
//            0.1,
//            0.4,
//            0.9
//          ]
      ),
    ];

//    final LineChartBarData tooltipsOnBar = lineBarsData[0];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blueGrey[300]),
//      height: 350,
//      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Cases Timeline",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(height: 3,),
              Text(
                "Tap/Drag on graph to see details.",
                textAlign: TextAlign.center,
//                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('Beginning'),
                    Switch(
                      onChanged: (val) => setState(() => {if(_isSwitched1!=true){_isSwitched1 = val,_isSwitched2= !val,_isSwitched3 = !val}}),
                      value: _isSwitched1,activeColor: Colors.redAccent,
                    ),
                  ],),
                  Column(children: <Widget>[
                    Text('30 Days'),
                    Switch(
                      onChanged: (val) => setState(() => {if(_isSwitched2!=true){_isSwitched1 = !val,_isSwitched2= val,_isSwitched3 = !val}}),
                      value: _isSwitched2,activeColor: Colors.redAccent,
                    ),
                  ],),
                  Column(children: <Widget>[
                    Text('15 Days'),
                    Switch(
                      onChanged: (val) => setState(() => {if(_isSwitched3!=true){_isSwitched1 = !val,_isSwitched2= !val,_isSwitched3 = val}}),
                      value: _isSwitched3,activeColor: Colors.redAccent,
                    ),
                  ],),
                ],
              ),
//              Text(
//                "Last 30 days",
//                textAlign: TextAlign.center,
//              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
//                height: 200,
                child: Expanded(
                  child: LineChart(
                    LineChartData(
//                    showingTooltipIndicators: showIndexes.map((index) {
//                      return ShowingTooltipIndicators(index, [
//                        LineBarSpot(
//                            tooltipsOnBar, lineBarsData.indexOf(tooltipsOnBar), tooltipsOnBar.spots[index]),
//                      ]);
//                    }).toList(),
                      lineTouchData: LineTouchData(
                        enabled: true,
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((index) {
                            return TouchedSpotIndicatorData(
                              FlLine(
                                color: Colors.pink,
                              ),
                              FlDotData(
                                show: true,
                                dotSize: 2,
                                strokeWidth: 2,
//                    getStrokeColor: (spot, percent, barData) => Colors.black,
                                getDotColor: (spot, percent, barData) {
                                  return lerpGradient(barData.colors,
                                      barData.colorStops, percent / 100);
                                },
                              ),
                            );
                          }).toList();
                        },
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.redAccent,
                          tooltipRoundedRadius: 10,
                          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                            return lineBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                lineBarSpot.y.toString().split('.')[0] +
                                    ': ' +
                                    '${widget.firstCase
                                        .add(Duration(days: int.parse(
                                        lineBarSpot.x.toString().split(
                                            '.')[0])))
                                        .month}/' +
                                    '${widget.firstCase
                                        .add(Duration(days: int.parse(
                                        lineBarSpot.x.toString().split(
                                            '.')[0])))
                                        .day}',
//                                  + '  :  ' +
//                                  dates[int.parse(lineBarSpot.x
//                                          .toString()
//                                          .split('.')[0])]
//                                      .toString()
//                                      .substring(1, 3) +
//                                  '/' +
//                                  dates[int.parse(lineBarSpot.x
//                                          .toString()
//                                          .split('.')[0])]
//                                      .toString()
//                                      .substring(0, 1),
                                //lineBarSpot.x.toString().substring(1,3)+'/'+lineBarSpot.x.toString().substring(0,1),
                                const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      lineBarsData: lineBarsData,
                      minY: 0,
                      //clipToBorder: true,
                      titlesData: FlTitlesData(
                        leftTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: widget.intervals,
                            rotateAngle: 20,
                            textStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.blueGrey,
                                letterSpacing: -1)),
                        bottomTitles: SideTitles(
                            showTitles: false,
                            interval: dates.length / 10,
                            margin: 5,
                            rotateAngle: 90,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontFamily: 'Digital',
                              fontSize: 10,
                            )),
                      ),
                      axisTitleData: FlAxisTitleData(
                        //            rightTitle: AxisTitle(showTitle: true, titleText: 'count'),
                        //            leftTitle: AxisTitle(showTitle: true, titleText: 'count'),
                        topTitle: AxisTitle(
                            showTitle: false,
                            titleText: '30 day data',
                            textAlign: TextAlign.center),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(
                        show: false,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 10,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Cases'),
                        Icon(
                          Icons.assignment_return,
                          color: Colors.orangeAccent,
                          size: 20,
                        ),
                        Divider(
                          height: 10,
                        ),
                        Text('Recovered'),
                        Icon(
                          Icons.assignment_return,
                          color: Colors.lightGreen,
                          size: 20,
                        ),
                        Divider(
                          height: 10,
                        ),
                        Text('Deaths'),
                        Icon(
                          Icons.assignment_return,
                          color: Colors.purple,
                          size: 20,
                        ),
                      ],
                    ),
//                    Divider(height: 5,),
//                    Text('Cases : Day no.'),
//                    Text('Recovered : Day no.'),
//                    Text('Deaths : Day no.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lerps between a [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (stops == null || stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / colors.length;
      stops.add(percent * (index + 1));
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s], rightStop = stops[s + 1];
    final leftColor = colors[s], rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT);
    }
  }
  return colors.last;
}
