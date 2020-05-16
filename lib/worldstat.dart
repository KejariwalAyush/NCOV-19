import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Countries.dart';
import 'package:flutter_app/splash.dart';
import 'package:photo_view/photo_view.dart';

import 'LineChart.dart';

const String fontName = 'Comfortaa';

// ignore: must_be_immutable
class WorldData extends StatefulWidget {
  static var keys = worldHistory['cases'].keys;
  static int cnt1 = 0;
  static var d = worldHistory['cases'].keys.toString().substring(1, 9);
  static int cnt2 = 0;
  static int cnt3 = 0;
  static var timeline = cnt1;

  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  DateTime firstCase = DateTime(2020, int.parse(WorldData.d.split('/')[0]),
      int.parse(WorldData.d.split('/')[1]));

  final List<FlSpot> wldCaseHist = [
    for (var i in worldHistory['cases'].keys)
      FlSpot(double.parse((WorldData.cnt1++).toString()),
          double.parse(worldHistory['cases'][i].toString())),
  ];

  final List<FlSpot> wldRecovHist = [
    for (var i in worldHistory['cases'].keys)
      FlSpot(double.parse((WorldData.cnt2++).toString()),
          double.parse(worldHistory['recovered'][i].toString())),
  ];

  final List<FlSpot> wldDeathHist = [
    for (var i in worldHistory['cases'].keys)
      FlSpot(double.parse((WorldData.cnt3++).toString()),
          double.parse(worldHistory['deaths'][i].toString())),
  ];

  var dropdownValue = 'USA';

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation.index;
    return Scaffold(
        appBar: AppBar(
          title: Text("NCOV - 19",
              style: TextStyle(
                fontFamily: fontName,
                color: Colors.white,
                fontSize: 20.0,
              )),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          elevation: 20,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.all(10),
                width: double.maxFinite,
//            height: ,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey[100]),
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          text: 'WORLD',
                          style: TextStyle(
                              fontFamily: fontName,
                              color: Colors.blue,
                              fontSize: 28),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Stats',
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 20),
                            )
                          ]),
                    ),
                    Divider(
                      height: 10,
                    ),
                    orientation == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  DataCard3(
                                      'Cases',
                                      tcasewld,
                                      '${newcasecont[8]}',
                                      world['cases'],
                                      world['todayCases']),
                                  Divider(
                                    height: 10,
                                  ),
                                  DataCard3(
                                      'Deaths',
                                      deathwld,
                                      '${newdeathcont[8]}',
                                      world['deaths'],
                                      world['todayDeaths']),
                                ],
                              ),
//                        Divider(height: 10,),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    DataCard2('Recovered', world['recovered'],
                                        newrecovwld),
//                              Divider(height: 10,),
                                    DataCard2(
                                        'Active',
                                        world['active'],
                                        int.parse(newcasecont[8]
                                                .toString()
                                                .replaceAll(',', '')
                                                .replaceAll('+', '')) -
                                            int.parse(newdeathcont[8]
                                                .toString()
                                                .replaceAll(',', '')
                                                .replaceAll('+', '')) -
                                            newrecovwld),
                                  ]),
//                        Divider(height: 10,),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    DataCard('Critical', world['critical']),
                                    Divider(
                                      height: 10,
                                    ),
                                    DataCard('Tests', world['tests']),
                                  ]),
//                        Divider(height: 10,),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    DataCard('Cases/Million',
                                        world['casesPerOneMillion']),
                                    Divider(
                                      height: 10,
                                    ),
                                    DataCard('Deaths/Million',
                                        world['deathsPerOneMillion']),
                                  ]),
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  DataCard4(
                                      'Cases',
                                      tcasewld,
                                      '${newcasecont[8]}',
                                      world['cases'],
                                      world['todayCases']),
//                            Divider(height: 10,),
                                  DataCard4(
                                      'Deaths',
                                      deathwld,
                                      '${newdeathcont[8]}',
                                      world['deaths'],
                                      world['todayDeaths']),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Divider(
                                    height: 10,
                                  ),
                                  DataCard2('Recov.', world['recovered'],
                                      newrecovwld),
//                              Divider(height: 10,),
                                  DataCard2(
                                      'Active',
                                      world['active'],
                                      int.parse(newcasecont[8]
                                              .toString()
                                              .replaceAll(',', '')
                                              .replaceAll('+', '')) -
                                          int.parse(newdeathcont[8]
                                              .toString()
                                              .replaceAll(',', '')
                                              .replaceAll('+', '')) -
                                          newrecovwld),
                                  DataCard('Cases/Million',
                                      world['casesPerOneMillion']),
                                  DataCard('Deaths/Million',
                                      world['deathsPerOneMillion']),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  DataCard('Critical', world['critical']),
                                  DataCard('Tests', world['tests']),
                                ],
                              ),
                            ],
                          ),
//                    Divider(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey[300]),
                      width: double.maxFinite,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorldMap()));
                              print('Tapped on World heat map');
                            },
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'WORLD',
                                    style: TextStyle(
                                        fontFamily: fontName,
                                        color: Colors.redAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Map & other Graphs',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 14),
                                      ),
                                      TextSpan(
                                        text:
                                            '\nTAP HERE! to explore more maps & Graphs',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Divider(),
                                Center(
                                  child: Text(
                                    'Cases Heat Map Area-wise',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
//                                Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/COVID-19_Outbreak_World_Map_per_Capita.svg/1920px-COVID-19_Outbreak_World_Map_per_Capita.svg.png',
//                                  width: double.maxFinite,fit: BoxFit.fitWidth,
//                                ),
                                Card(
                                  color: Colors.blueGrey[100],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: PhotoView(
                                      minScale:
                                          PhotoViewComputedScale.contained,
                                      maxScale:
                                          PhotoViewComputedScale.contained,
                                      initialScale:
                                          PhotoViewComputedScale.contained,
                                      enableRotation: false,
                                      basePosition: Alignment.center,
                                      tightMode: true,
                                      //minScale: 10,
                                      imageProvider: NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/COVID-19_Outbreak_World_Map_per_Capita.svg/1920px-COVID-19_Outbreak_World_Map_per_Capita.svg.png',
                                      ),
                                      backgroundDecoration: BoxDecoration(
                                          color: Colors.blueGrey[100]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                    ),
                    orientation == 0
                        ? Column(
                            children: <Widget>[
                              PieChart(),
                              Divider(
                                height: 10,
                              ),
                              LineChart1(
                                  wldCaseHist,
                                  wldRecovHist,
                                  wldDeathHist,
                                  tcasewld / 4,
                                  firstCase,
                                  WorldData.timeline),
                            ],
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueGrey[300]),
                            width: double.maxFinite,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Divider(),
                                              Center(
                                                child: Text(
                                                  'Cases Heat Map Country-wise',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              Card(
                                                color: Colors.blueGrey[100],
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: PhotoView(
                                                    minScale:
                                                        PhotoViewComputedScale
                                                            .contained,
                                                    maxScale:
                                                        PhotoViewComputedScale
                                                            .contained,
                                                    initialScale:
                                                        PhotoViewComputedScale
                                                            .contained,
                                                    enableRotation: false,
                                                    basePosition:
                                                        Alignment.center,
                                                    tightMode: true,
                                                    //minScale: 10,
                                                    imageProvider: NetworkImage(
                                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/COVID-19_Outbreak_World_Map.svg/1920px-COVID-19_Outbreak_World_Map.svg.png',
                                                    ),
                                                    backgroundDecoration:
                                                        BoxDecoration(
                                                            color: Colors
                                                                .blueGrey[100]),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        PieChart(),
                                      ],
                                    )),
//                        Divider(height: 10,),
                                Expanded(
                                  flex: 1,
                                  child: LineChart1(
                                      wldCaseHist,
                                      wldRecovHist,
                                      wldDeathHist,
                                      tcasewld / 4,
                                      firstCase,
                                      WorldData.timeline),
                                ),
                              ],
                            ),
                          ),
                    Divider(
                      height: 10,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'CONTINENT-wise',
                            style: TextStyle(
                                fontFamily: fontName,
                                color: Colors.blue,
                                fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Stats',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 16),
                              )
                            ]),
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    for (int i = 0; i < 6; orientation == 0 ? i += 2 : i += 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ContinentCard(
                              continent[i]['continent'],
                              continent[i]['cases'],
                              continent[i]['deaths'],
                              continent[i]['recovered'],
                              continent[i]['active']),
                          ContinentCard(
                              continent[i + 1]['continent'],
                              continent[i + 1]['cases'],
                              continent[i + 1]['deaths'],
                              continent[i + 1]['recovered'],
                              continent[i + 1]['active']),
                          if (orientation != 0)
                            ContinentCard(
                                continent[i + 2]['continent'],
                                continent[i + 2]['cases'],
                                continent[i + 2]['deaths'],
                                continent[i + 2]['recovered'],
                                continent[i + 2]['active']),
                        ],
                      ),
                    Divider(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'Select Country\'s Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Center(
                      child: Text(
                        'List sorted according to no. of cases',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      hint: Text('Select Country'),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CountriesData(dropdownValue)));
                          print('Tapped on $dropdownValue');
                        });
                      },
                      items: <String>[
                        for (var i in countryData) '${i['country']}',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        );
                      }).toList(),
                    ),
//                    CountriesData(dropdownValue),
                    Divider(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.all(5),
                      width: double.maxFinite,
                      height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey[300]),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Text(
                              'Stats of Top 50 Countries',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                            Center(
                                child: Text(
                              'Tap on Countries Name to know more!\nOr search in above list.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.blueGrey[700]),
                            )),
                            DataTable(
                              columnSpacing: 10,
                              dataRowHeight: 35,
                              headingRowHeight: 50,
                              horizontalMargin: 10,
                              columns: [
                                DataColumn(
                                  label: Text('Countries'),
                                ),
                                DataColumn(
                                  label: Text('Cases'),
                                ),
                                DataColumn(
                                  label: Text('Deaths'),
                                ),
                                DataColumn(
                                  label: Text('Recovered'),
                                ),
                              ],
                              rows: [
                                for (int i = 9; i <= 59; i++)
                                  DataRow(cells: [
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                          text: '${contries[i]}',
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                      placeholder: true,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountriesData(
                                                        contries[i])));
                                        print('Tapped on ${contries[i]}');
                                      },
                                    ),
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                            text: '${casescont[i]}\n',
                                            style: TextStyle(
                                                fontFamily: fontName,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '${newcasecont[i]}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12),
                                              )
                                            ]),
                                      ),
                                      placeholder: true,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountriesData(
                                                        contries[i])));
                                        print('Tapped on ${contries[i]}');
                                      },
                                    ),
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                            text: '${deathcont[i]}\n',
                                            style: TextStyle(
                                                fontFamily: fontName,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '${newdeathcont[i]}',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12),
                                              )
                                            ]),
                                      ),
                                      placeholder: true,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountriesData(
                                                        contries[i])));
                                        print('Tapped on ${contries[i]}');
                                      },
                                    ),
                                    DataCell(
                                      RichText(
                                        text: TextSpan(
                                          text: '${recovercont[i]}',
                                          style: TextStyle(
                                              fontFamily: fontName,
                                              color: Colors.black),
//                                    children: <TextSpan>[
//                                      TextSpan(text: '${newcasecont[i]}',
//                                        style: TextStyle(
//                                            color: Colors.black38, fontSize: 8),
//                                      )
//                                    ]
                                        ),
                                      ),
                                      placeholder: true,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CountriesData(
                                                        contries[i])));
                                        print('Tapped on ${contries[i]}');
                                      },
                                    ),
                                  ])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class GradesData {
  final String gradeSymbol;
  final int number;
  final charts.Color col;

  GradesData(this.gradeSymbol, this.number, this.col);
}

class PieChart extends StatelessWidget {
  final data = [
    GradesData(
        'Active',
        int.parse(
            (world['active'] / world['cases'] * 100).toString().split('.')[0]),
        charts.ColorUtil.fromDartColor(Colors.redAccent)),
    GradesData(
        'Recov',
        int.parse((world['recovered'] / world['cases'] * 100)
            .toString()
            .split('.')[0]),
        charts.ColorUtil.fromDartColor(Colors.lightGreen)),
    GradesData(
        'Deaths',
        int.parse(
            (world['deaths'] / world['cases'] * 100).toString().split('.')[0]),
        charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
        id: "Grades",
        data: data,
        labelAccessorFn: (GradesData row, _) =>
            '${row.gradeSymbol}:${row.number}%',
        domainFn: (GradesData grades, _) => grades.gradeSymbol,
        measureFn: (GradesData grades, _) => grades.number,
        colorFn: (GradesData series, _) => series.col,
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        height: 200,
        width: double.maxFinite,
        padding: EdgeInsets.all(10),
        child: Card(
          color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Total data represented in PIE Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
//                  SizedBox(
//                    height: 20,
//                  ),
                Expanded(
                  child: new charts.PieChart(
                    _getSeriesData(),
                    animate: true,
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 200,
                        startAngle: 84,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator()
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataCard extends StatelessWidget {
  String txt;
  var txtdata;

  DataCard(this.txt, this.txtdata);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
//        height: 75.0,
//        width: 150,
        decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '$txt',
              style: TextStyle(fontSize: 20, color: Colors.white60),
              textAlign: TextAlign.center,
            ),
            Text(
              '$txtdata',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataCard2 extends StatelessWidget {
  String txt, txt2;
  var txtdata, txt2data;

  DataCard2(this.txt, this.txtdata, this.txt2data);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation.index;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
//      height: 75.0,
//      width: 150,
        decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '$txt',
              style: TextStyle(fontSize: 20, color: Colors.white60),
              textAlign: TextAlign.center,
            ),
//            Text(
//              '$txtdata', style: TextStyle(fontSize: 20, color: Colors.white),
//              textAlign: TextAlign.center,),
//            Text('${txt2data.toString() != '0' ? '+$txt2data' : 'N/A'}',
//              style: TextStyle(fontSize: 16, color: Colors.redAccent),
//              textAlign: TextAlign.center,),
            RichText(
              text: TextSpan(
                text: '$txtdata',
                style: TextStyle(fontSize: 20, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '${orientation == 0 ? '\n' : ''}${txt2data.toString() != '0' ? '+$txt2data' : 'N/A'}',
                    style: TextStyle(
                        fontSize: orientation == 0 ? 16 : 12,
                        color: Colors.redAccent),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ContinentCard extends StatelessWidget {
  String continentName;
  var cases, deaths, recovered, active;

  ContinentCard(
      this.continentName, this.cases, this.deaths, this.recovered, this.active);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
//        height: 125.0,
//        width: 150,
            decoration: new BoxDecoration(
              color: new Color(0xFF333366),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$continentName',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  height: 5,
                ),
                Text(
                  'Cases: $cases',
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Recov.: $recovered',
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Deaths: $deaths',
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Active: $active',
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  height: 2,
                ),
                //          Text('${txt2data!='0'?'+$txt2data':''}',style: TextStyle(fontSize: 16,color: Colors.redAccent),textAlign: TextAlign.center,),
                //          RichText(text:TextSpan(text:'$txtdata',style: TextStyle(fontSize: 20,color: Colors.white),
                //            children: <TextSpan>[TextSpan(text:'${txt2data==0?'':' +$txt2data'}',style: TextStyle(fontSize: 15,color: Colors.redAccent),
              ],
            ),
          ),
//      Divider(height: 10,),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DataCard3 extends StatelessWidget {
  String txt;
  var txtdata, txt2data, txt3data, txt4data;

  DataCard3(
      this.txt, this.txtdata, this.txt2data, this.txt3data, this.txt4data);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
//      height: 135.0,
//      width: 150,
        decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '$txt',
              style: TextStyle(fontSize: 20, color: Colors.white60),
              textAlign: TextAlign.center,
            ),
            Text(
              '$txtdata',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              '${txt2data.toString() != '0' ? '$txt2data' : 'N/A'}',
              style: TextStyle(fontSize: 12, color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),
            Text(
              'Yesterday',
              style: TextStyle(fontSize: 14, color: Colors.white60),
              textAlign: TextAlign.center,
            ),
            Text(
              '$txt3data',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              '${txt4data.toString() != '0' ? '+$txt4data' : 'N/A'}',
              style: TextStyle(fontSize: 12, color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),

//          RichText(text:TextSpan(text:'$txtdata',style: TextStyle(fontSize: 20,color: Colors.white),
//            children: <TextSpan>[TextSpan(text:'${txt2data==0?'':' +$txt2data'}',style: TextStyle(fontSize: 15,color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DataCard4 extends StatelessWidget {
  String txt;
  var txtdata, txt2data, txt3data, txt4data;

  DataCard4(
      this.txt, this.txtdata, this.txt2data, this.txt3data, this.txt4data);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
//      height: 135.0,
//      width: 150,
        decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Today $txt',
                  style: TextStyle(fontSize: 20, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$txtdata',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${txt2data.toString() != '0' ? '$txt2data' : 'N/A'}',
                  style: TextStyle(fontSize: 12, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
//          RichText(text:TextSpan(text:'$txtdata',style: TextStyle(fontSize: 20,color: Colors.white),
//            children: <TextSpan>[TextSpan(text:'${txt2data==0?'':' +$txt2data'}',style: TextStyle(fontSize: 15,color: Colors.redAccent),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Yesterday $txt',
                  style: TextStyle(fontSize: 20, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$txt3data',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${txt4data.toString() != '0' ? '+$txt4data' : 'N/A'}',
                  style: TextStyle(fontSize: 12, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorldMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NCOV - 19",
              style: TextStyle(
                fontFamily: fontName,
                color: Colors.white,
                fontSize: 20.0,
              )),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          elevation: 20,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
//            height: ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey[100]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
//                      Divider(),
                      Center(
                        child: Text(
                          'Cases HEAT map Country wise',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/COVID-19_Outbreak_World_Map.svg/1920px-COVID-19_Outbreak_World_Map.svg.png',
                        width: double.maxFinite,
                      ),
//                  PhotoView(
//                    enableRotation: false,basePosition: Alignment.center,//tightMode: true,//minScale: 10,
//                    imageProvider: NetworkImage(
//                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/COVID-19_Outbreak_Cases_in_India.svg',),
//                    backgroundDecoration: BoxDecoration(color: Colors.white70),
//                  ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Divider(),
                      Center(
                        child: Text(
                          'Deaths HEAT map Country wise per Capita',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/COVID-19_Outbreak_World_Map_Total_Deaths_per_Capita.svg/1920px-COVID-19_Outbreak_World_Map_Total_Deaths_per_Capita.svg.png',
                        width: double.maxFinite,
                      ),
                    ],
                  ),
                ),
//                Divider(height: 10,),
                for (var link in imgLinks)
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Divider(),
                        PhotoView(
                          enableRotation: false,
                          basePosition: Alignment.center,
                          tightMode: true,
                          //minScale: 10,
                          imageProvider: NetworkImage(link),
                          backgroundDecoration:
                              BoxDecoration(color: Colors.white70),

                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.contained,
                          initialScale: PhotoViewComputedScale.contained,
//                        basePosition: Alignment.center,
//                        scaleStateCycle: scaleStateCycle
                        ),
//                      Center(child: Text('Deaths HEAT map Country wise per Capita',style: TextStyle(fontSize: 16),),),
//                      Image.network(link,
//                        width: double.maxFinite,
//                      ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}

List imgLinks = [
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Total-confirmed-cases-of-covid-19-per-million-people.png/1280px-Total-confirmed-cases-of-covid-19-per-million-people.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/2020_coronavirus_cases_by_date_of_report.svg/494px-2020_coronavirus_cases_by_date_of_report.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Coronavirus_-_Most_affected_countries_-_top_10.png/441px-Coronavirus_-_Most_affected_countries_-_top_10.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Covid-19_new_cases_in_top_5_countries_and_the_world.png/501px-Covid-19_new_cases_in_top_5_countries_and_the_world.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Time_series_of_active_COVID-19_cases%2C_most_affected_countries.svg/440px-Time_series_of_active_COVID-19_cases%2C_most_affected_countries.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Covid-19_daily_cases_trajectory_per_million_all_continents_4-27.svg/468px-Covid-19_daily_cases_trajectory_per_million_all_continents_4-27.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Worldwide_Coronavirus_Curve_4-24-20.png/519px-Worldwide_Coronavirus_Curve_4-24-20.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Covid-19_total_cases_per_100_000_population_from_selected_countries.png/462px-Covid-19_total_cases_per_100_000_population_from_selected_countries.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Total-covid-deaths-per-million.png/553px-Total-covid-deaths-per-million.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Covid-19_daily_deaths_in_top_5_countries_and_the_world.png/634px-Covid-19_daily_deaths_in_top_5_countries_and_the_world.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Covid-19-total-confirmed-cases-vs-total-confirmed-deaths.svg/553px-Covid-19-total-confirmed-cases-vs-total-confirmed-deaths.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Coronavirus-cfr.svg/553px-Coronavirus-cfr.svg.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Covid-19_deaths_per_100_000_population.png/546px-Covid-19_deaths_per_100_000_population.png',
];
