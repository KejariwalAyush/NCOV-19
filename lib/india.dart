
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/LineChart.dart';
import 'package:flutter_app/splash.dart';
import 'package:flutter_app/worldstat.dart';

var colorsList = [Colors.blue[100],Colors.blue[200],Colors.blue[300],Colors.blueAccent,
  Colors.cyanAccent,Colors.purple[100],Colors.purple[200],Colors.purple[300],
  Colors.purple[400],Colors.purple[500],Colors.purple[800],Colors.deepPurple[300],
  Colors.deepPurple[500],Colors.indigo[500],Colors.purpleAccent,Colors.teal[300],
  Colors.teal[300],Colors.teal[500],Colors.teal[800],Colors.green[300],
  Colors.green[500],Colors.green[800],Colors.lightGreen[500],Colors.lightGreen[800],
  Colors.lime[500],Colors.lime[800],Colors.lime[900],Colors.lime[300],
  Colors.amber[500],Colors.amber[800],Colors.amber[900],Colors.amber[300],
  Colors.pink[500],Colors.pink[800],Colors.pink[900],Colors.pink[300],Colors.pinkAccent,Colors.redAccent];


class India extends StatefulWidget {
  static const String fontName = 'Comfortaa';

  @override
  _IndiaState createState() => _IndiaState();
}
String dropdownvalue = distdata[0]['state'];
class _IndiaState extends State<India> {
  DateTime firstCase = DateTime(2020,int.parse(dates[0].toString().split('/')[0]),int.parse(dates[0].toString().split('/')[1]));

//  String dropdownvalue = 'One';
//  ScrollController myScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NCOV - 19",
            style: TextStyle(
              fontFamily: India.fontName,
              color: Colors.white,
              fontSize: 20.0,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
        elevation: 20,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent,
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
         children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
//            height: ,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey[100]),
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: 'INDIA',
                      style: TextStyle(fontFamily: India.fontName,
                          color: Colors.blue, fontSize: 28),
                      children: <TextSpan>[
                        TextSpan(text: ' Stats',
                          style: TextStyle(
                              color: Colors.black38, fontSize: 20),
                        ),
//                        TextSpan(text: '\nLast Updated on: ${indAllData[0]['overall']['lastupdatedtime']}',
//                          style: TextStyle(
//                              color: Colors.black38, fontSize: 20),
//                        )
                      ]
                  ),
                ),

                Divider(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DataCard2('Cases',tcaseind,newtcaseind),
                        Divider(height: 10,),
                        DataCard2('Deaths',deathind,newdeathind),
                      ],
                    ),
                    Divider(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        DataCard2('Recovered',recovind,newrecovind),
                        Divider(height: 10,),
                        DataCard2('Active',actcaseind,'${newtcaseind==0?'':' ${newtcaseind-newdeathind-newrecovind}'}'),
                      ],
                    ),
                    Divider(height: 10,),


                  ],
                ),
                Divider(height: 10,),
                PieChart(),
                Divider(height: 10,),
                Center(child: Text('State-wise Data',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.all(5),
                  width: double.maxFinite,
                  height: 250,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[300]),
                  child: Scrollbar(
                    child: SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
                      child:DataTable(
                        columnSpacing: 1,
                        dataRowHeight: 30,
                        headingRowHeight: 50,
                        horizontalMargin: 10,
//                        sortColumnIndex: 1,
//                        sortAscending: true,
                        columns: [
                          DataColumn(label: Text('States'),),
                          DataColumn(label: Text('Cases'),numeric: true,),
//                            onSort: (columnIndex, ascending) {
////                            setState(() {
////                            sort = !sort;
////                            });
//                            onSort(columnIndex);}),
                          DataColumn(label: Text('Deaths'),numeric: true),
                          DataColumn(label: Text('Recovered'),numeric: true,),
                        ],
                        rows: [
                          for(int i=1;i<states.length;i++)
                            DataRow(
                                cells:[
                              DataCell(
                                 RichText(
                                    text: TextSpan(
                                      text: '${states[i]}',
                                      style: TextStyle(fontFamily: India.fontName,
                                          color: Colors.deepPurple),
                                    ),
                                ),
                              ),
                              DataCell(RichText(
                                text: TextSpan(
                                    text: '${stateData[i]}',
                                    style: TextStyle(fontFamily: India.fontName,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(text: '${newstateData[i]=='0'?'':'\n+${newstateData[i]}'}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    ]
                                ),
                              ),),
                              DataCell(RichText(
                                text: TextSpan(
                                    text: '${stateDeath[i]}',
                                    style: TextStyle(fontFamily: India.fontName,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(text: '${newstateDeath[i]=='0'?'':'\n+${newstateDeath[i]}'}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    ]
                                ),
                              ),),
                              DataCell(RichText(
                                text: TextSpan(
                                  text: '${stateRecov[i]}',
                                  style: TextStyle(fontFamily: India.fontName,
                                      color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(text: '${newstateRecov[i]=='0'?' ':'\n+${newstateRecov[i]}'}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    ]
                                ),
                              ),
                              ),
                            ],
//                              onSelectChanged: DataTable(rows: <DataRow>[], columns: <DataColumn>[],),
                            ),
                        ],
                      ),
                  ),
                  ),
                ),
                Divider(height: 10,),
                Center(child: Text('District-wise Data',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                District(),
                Divider(height: 10,),
                LineChart1(allSpots,allSpots2,allSpots3,tcaseind/4,firstCase,timeline),
                Divider(height: 10,),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[300]),
                  width:double.maxFinite,
//                  height: 650,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => IndiaMap()));
                          print('Tapped on India heat map');
                        },
                        child: RichText(
                          textAlign:TextAlign.center,
                          text: TextSpan(
                              text: 'INDIA heat',
                              style: TextStyle(fontFamily: India.fontName,
                                  color: Colors.redAccent, fontSize: 20),
                              children: <TextSpan>[
                                TextSpan(text: ' Map',
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 14),
                                ),
                                TextSpan(text:'\nTAP HERE! to explore more maps',
                                  style: TextStyle(fontSize: 16,color: Colors.blue),
                                ),
                              ]
                          ),
                        ),
                      ),
                      Divider(height: 10,),
                      Text('Cases in India',style: TextStyle(fontSize: 16,color: Colors.black87),),
                      Card(color: Colors.blueGrey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/COVID-19_Outbreak_Cases_in_India.svg/220px-COVID-19_Outbreak_Cases_in_India.svg.png',
                            fit: BoxFit.fitWidth,
                          ),
//                          PhotoView(
//                            enableRotation: false,basePosition: Alignment.center,tightMode: true,//minScale: 10,
//                            imageProvider: NetworkImage(
//                              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/COVID-19_Outbreak_Cases_in_India.svg/220px-COVID-19_Outbreak_Cases_in_India.svg.png',),
//                              backgroundDecoration: BoxDecoration(color: Colors.blueGrey[100]),
//                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 10,),
                BarChart(),
                BarChart2(),
                BarChart3(),

              ],
            ),
          ),

        ],
      ),)
    );
  }
}



//var d = dates[0].toString().substring(1,9);
//firstCase = DateTime(2020,int.parse(d.split('/')[0]),int.parse(d.split('/')[1]));
final List<FlSpot> allSpots = [
  for (int i = 0; i < days.length; i++)
    FlSpot(double.parse(days[i].toString()), double.parse(datetotcase[i])),
];

final List<FlSpot> allSpots2 = [
  for (int i = 0; i < days.length; i++)
    FlSpot(double.parse(days[i].toString()), double.parse(datetotrecov[i])),
];

final List<FlSpot> allSpots3 = [
  for (int i = 0; i < days.length; i++)
    FlSpot(double.parse(days[i].toString()), double.parse(datetotdeath[i])),
];
var timeline = days.length;
class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {

  int stcount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.all(5),
        width: double.maxFinite,
        height: 230,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        child:Scrollbar(
//          controller: ScrollController(keepScrollOffset: false,initialScrollOffset: 20),
            child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Column(children: <Widget>[
            DropdownButton<String>(
              value: dropdownvalue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownvalue = newValue;
//                  stcount = 3;
                  for(int i=0;i<distdata.length;i++)
                  if(distdata[i]['state'].compareTo(dropdownvalue.toString())==0){
                    stcount = i;break;
                  }
                });
              },
              items: <String>[for(var st=0;st< distdata.length;st++)
    //            if(stateData[st]==0)
                  distdata[st]['state'],]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
            DataTable(
              columnSpacing: 1,
              dataRowHeight: 30,
              headingRowHeight: 50,
              horizontalMargin: 10,
//                        sortColumnIndex: 1,
//                        sortAscending: true,
              columns: [
                DataColumn(label: Text('Districts'),),
                DataColumn(label: Text('Cases'),numeric: true,),
              ],
              rows: [
                for(var i in distdata[stcount]['districtData'])
                  DataRow(
                    cells:[
                      DataCell(
                        RichText(
                          text: TextSpan(
                            text: '${i['district']}',
                            style: TextStyle(fontFamily: India.fontName,
                                color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      DataCell(RichText(
                        text: TextSpan(
                            text: '${i['confirmed']}',
                            style: TextStyle(fontFamily: India.fontName,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: '${i['delta']['confirmed']==0?'':' +${i['delta']['confirmed']}'}',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 12),
                              )
                            ]
                        ),
                      ),),

                    ],
//                              onSelectChanged: DataTable(rows: <DataRow>[], columns: <DataColumn>[],),
                  ),
              ],
            ),
          
          ],
        ),
        ),
        ),
    );
  }
}

class PieChart extends StatelessWidget {


  final data = [
    GradesData('Active', actcaseind,charts.ColorUtil.fromDartColor(Colors.pinkAccent)),
    GradesData('Recovered', recovind,charts.ColorUtil.fromDartColor(Colors.lightGreen)),
    GradesData('Deaths', deathind,charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (GradesData row, _) => '${row.gradeSymbol}:${row.number}',
          domainFn: (GradesData grades, _) => grades.gradeSymbol,
          measureFn: (GradesData grades, _) => grades.number,
          colorFn: (GradesData series, _) => series.col,
      )
    ];
    return series;
  }
  final dataState = [
    for(int i=1;i<states.length;i++)
      StData('${states[i].toString().substring(0,states[i].toString().length>8?9:states[i].toString().length)}${states[i].toString().length>9?'...':''}',
          int.parse(stateData[i]),charts.ColorUtil.fromDartColor(colorsList[i])),
  ];

  _getStateData() {
    List<charts.Series<StData, String>> series = [
      charts.Series(
        id: "Grades",
        data: dataState,
        labelAccessorFn: (StData row, _) => '${row.statesName}',
        domainFn: (StData grades, _) => grades.statesName,
        measureFn: (StData grades, _) => grades.number,
        colorFn: (StData series, _) => series.col,
      )
    ];
    return series;
  }
  final genderdata = [
    GenderData('Male',male,charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    GenderData('Female',female,charts.ColorUtil.fromDartColor(Colors.pinkAccent))
  ];

  _getGenderData() {
    List<charts.Series<GenderData, String>> series = [
      charts.Series(
        id: "Grades",
        data: genderdata,
        labelAccessorFn: (GenderData row, _) => '${row.gender}',
        domainFn: (GenderData grades, _) => grades.gender,
        measureFn: (GenderData grades, _) => grades.number,
        colorFn: (GenderData series, _) => series.col,
      )
    ];
    return series;
  }
  final agedata = [
    GenderData('0-20',one,charts.ColorUtil.fromDartColor(Colors.amberAccent)),
    GenderData('20-40',two,charts.ColorUtil.fromDartColor(Colors.amber)),
    GenderData('40-60',three,charts.ColorUtil.fromDartColor(Colors.lime)),
    GenderData('60-80',four,charts.ColorUtil.fromDartColor(Colors.lightGreen)),
    GenderData('>80',four,charts.ColorUtil.fromDartColor(Colors.teal)),
  ];

  _getAgeData() {
    List<charts.Series<GenderData, String>> series = [
      charts.Series(
        id: "Grades",
        data: agedata,
        labelAccessorFn: (GenderData row, _) => '${row.gender}',
        domainFn: (GenderData grades, _) => grades.gender,
        measureFn: (GenderData grades, _) => grades.number,
        colorFn: (GenderData series, _) => series.col,
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey[300]),
          height: 650,
          padding: EdgeInsets.all(10),
          child: Card(color: Colors.blueGrey[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Total data represented in PIE Chart",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16,
                        fontWeight: FontWeight.bold,color: Colors.deepOrange

                    ),
                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
//                  Divider(height: 10,),
                  Divider(height: 10,),
                  Expanded(
                    child: new charts.PieChart(
                      _getSeriesData(),
                      animate: true,
                      animationDuration: Duration(milliseconds: 800),
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 200,startAngle: 49,
                          arcRendererDecorators: [new charts.ArcLabelDecorator()]
                      ),
                    ),
                  ),
                  Divider(height: 10,),
                  Text(
                    "State-wise data",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16,
                        fontWeight: FontWeight.bold ,color: Colors.deepOrange
                    ),
                  ),
                  Expanded(
                    child: new charts.PieChart(
                      _getStateData(),
                      animate: true,
                      animationDuration: Duration(milliseconds: 800),
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 30,startAngle: 60,
                          arcRendererDecorators: [new charts.ArcLabelDecorator()]
                      ),
                    ),
                  ),
                  Divider(height: 10,),
                  Text(
                    "Gender data",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16,
                        fontWeight: FontWeight.bold ,color: Colors.deepOrange
                    ),
                  ),
                  Expanded(
                    child: new charts.PieChart(
                      _getGenderData(),
                      animate: true,
                      animationDuration: Duration(milliseconds: 800),
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 30,startAngle: 60,
                          arcRendererDecorators: [new charts.ArcLabelDecorator()]
                      ),
                    ),
                  ),

                    Text(
                      "Age data",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16,
                          fontWeight: FontWeight.bold ,color: Colors.deepOrange
                      ),
                    ),
                    Expanded(
                      child: new charts.PieChart(
                        _getAgeData(),
                        animate: true,
                        animationDuration: Duration(milliseconds: 800),
                        defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 30,startAngle: 60,
                            arcRendererDecorators: [new charts.ArcLabelDecorator()]
                        ),
                      ),
                    ),

                  //                  Divider(height: 10,),
                ],
              ),
            ),
          ),
        ),

    );
  }
}

class BarChart extends StatelessWidget {
  final data = [
    for(int i=0;i<dates.length;i++)
      new PopulationData(dates[i].toString(),int.parse(datecases[i])),
  ];
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
          id: "Population",
          data: data,overlaySeries: true,
          domainFn: (PopulationData series, _) => series.date.toString(),//.split(' ')[1],
//          domainFormatterFn: ,
          measureFn: (PopulationData series, _) => series.population,
      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        height: 200,
        padding: EdgeInsets.all(10),
        child: Card(color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Daily cases Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
//                  SizedBox(
//                    height: 20,
//                  ),
              Expanded(
                child: charts.BarChart(
                    _getSeriesData(),
                    animate: true,vertical: true,
                    domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(labelStyle: charts.TextStyleSpec(fontSize: 1,))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
class BarChart2 extends StatelessWidget {
  final data = [
    for(int i=0;i<dates.length;i++)
      new PopulationData(dates[i].toString(),int.parse(daterecov[i])),
  ];
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
        id: "Population",
        data: data,overlaySeries: true,
        domainFn: (PopulationData series, _) => series.date.toString(),//.split(' ')[1],
//          domainFormatterFn: ,
        measureFn: (PopulationData series, _) => series.population,
      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        height: 200,
        padding: EdgeInsets.all(10),
        child: Card(color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Daily RECOVERED Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
//                  SizedBox(
//                    height: 20,
//                  ),
                Expanded(
                  child: charts.BarChart(
                    _getSeriesData(),
                    animate: true,vertical: true,
                    domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(labelStyle: charts.TextStyleSpec(fontSize: 1,))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
class BarChart3 extends StatelessWidget {
  final data = [
    for(int i=0;i<dates.length;i++)
      new PopulationData(dates[i].toString(),int.parse(datedeath[i])),
  ];
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
        id: "Population",
        data: data,overlaySeries: true,
        domainFn: (PopulationData series, _) => series.date.toString(),//.split(' ')[1],
//          domainFormatterFn: ,
        measureFn: (PopulationData series, _) => series.population,
      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        height: 200,
        padding: EdgeInsets.all(10),
        child: Card(color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Daily DEATH cases Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Expanded(
                  child: charts.BarChart(
                    _getSeriesData(),
                    animate: true,vertical: true,
                    domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(labelStyle: charts.TextStyleSpec(fontSize: 1,))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


class GradesData {
  final String gradeSymbol;
  final int number;
  final charts.Color col;

  GradesData(this.gradeSymbol, this.number,this.col);
}
class StData {
  final String statesName;
  final int number;
  final charts.Color col;

  StData(this.statesName, this.number, this.col);

//  GradesData(this.gradeSymbol, this.number,this.col);
}
class GenderData{
  final String gender;
  final int number;
  final charts.Color col;

  GenderData(this.gender, this.number,this.col);
}
class PopulationData {
//  DateTime ddmm;
  String date;
  int population;
  PopulationData(
      this.date,
      this.population,
      );
}
class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final int sales;
}

class IndiaMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NCOV - 19",
            style: TextStyle(
              fontFamily: India.fontName,
              color: Colors.white,
              fontSize: 20.0,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
        elevation: 20,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Divider(),
                  Center(child: Text('Deaths Heat Map of India',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
                  Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/COVID-19_Death_Cases_in_India.png/800px-COVID-19_Death_Cases_in_India.png',
                    width: double.maxFinite,
                  ),

                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Divider(),
                  Center(child: Text('Cases Heat Map Timeline',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/COVID-19_India_Total_Cases_Animated_Map.gif/800px-COVID-19_India_Total_Cases_Animated_Map.gif',
                    width: double.maxFinite,fit: BoxFit.cover,
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
          ],
        ),
      )
    );
  }
}

