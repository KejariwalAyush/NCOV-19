import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';
import 'package:flutter_app/worldstat.dart';

import 'Countries.dart';


var updateTime,cases,deaths,recov,active;

var allSpots, allSpots2, allSpots3;
// ignore: must_be_immutable
class StatePage extends StatelessWidget {
  String stateName,stateCode;
  int stateIndex;
  var timeline,interval;
  DateTime firstDate;
  List conf = List(),reco = List(),deat = List(),dat=List();
  StatePage(this.stateName,this.stateCode,this.stateIndex){
    updateTime = stateTimeUpdate[stateIndex];
    cases = int.parse(stateData[stateIndex]);
    deaths = int.parse(stateDeath[stateIndex]);
    recov = int.parse(stateRecov[stateIndex]);
    active = int.parse(stateData[stateIndex])-int.parse(stateRecov[stateIndex])-int.parse(stateDeath[stateIndex]);
    int c=0,r=0,d=0;
    for(var i in statesDaily['states_daily'])
      {
        if(i['status']=='Confirmed'){
          c+=int.parse(i[stateCode.toLowerCase()]);
          conf.add(c);}
        else if(i['status']=='Recovered'){
          r+=int.parse(i[stateCode.toLowerCase()]);
          reco.add(r);}
        else if(i['status']=='Deceased'){
          d+=int.parse(i[stateCode.toLowerCase()]);
          deat.add(d);
          dat.add(i['date']);
        }
      }
//    timeline = dat.length;
    interval = cases/4;
    int mm =0;
    String x = dat[0].toString().split('-')[1].toLowerCase();
    x == 'jan'?mm=01:x=='feb'?mm=02:x=='mar'?mm=03:x=='apr'?mm=04:x=='may'?mm=05:x=='jun'?mm=06:
    x=='jul'?mm=07:x=='aug'?mm=08:x=='sep'?mm=09:x=='oct'?mm=10:x=='nov'?mm=11:mm=12;
    firstDate = DateTime(2020,mm,int.parse(dat[0].toString().split('-')[0]));
    int cnt1=0;
    allSpots = [
      for (var i in conf)
        FlSpot(double.parse((cnt1++).toString()),
            double.parse(i.toString())),
    ];
    int cnt2 = 0;
    allSpots2 = [
      for (var i in reco)
        FlSpot(double.parse((cnt2++).toString()),
            double.parse(i.toString())),
    ];
    int cnt3 = 0;
    allSpots3 = [
      for (var i in deat)
        FlSpot(double.parse((cnt3++).toString()),
            double.parse(i.toString())),
    ];
    timeline = cnt1;
  }
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery
        .of(context)
        .orientation
        .index;
    return Scaffold(
      appBar: AppBar(
        title: Text("NCOV - 19",
            style: TextStyle(
              fontFamily: fontName,
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
                    textAlign:TextAlign.center,
                    text: TextSpan(
                        text: 'States-wise',
                        style: TextStyle(fontFamily: fontName,
                            color: Colors.blue, fontSize: 28),
                        children: <TextSpan>[
                          TextSpan(text: ' Stats',
                            style: TextStyle(
                                color: Colors.black38, fontSize: 20),
                          ),
                          TextSpan(text: '\n$stateName',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.redAccent, fontSize: 32),
                          ),
                          TextSpan(text: '\nLast updated on: $updateTime',
                            style: TextStyle(
                                color: Colors.black54, fontSize: 16),
                          ),
                        ]
                    ),
                  ),
                  Divider(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      orientation == 0 ?
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              DataCard2(
                                  'Cases', cases, newstateData[stateIndex]),
                              Divider(height: 10,),
                              DataCard2(
                                  'Deaths', deaths, newstateDeath[stateIndex]),
                            ],
                          ),
                          Divider(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              DataCard2('Recovered', recov,
                                  newstateRecov[stateIndex]),
                              Divider(height: 10,),
                              DataCard2('Active', active,
                                  '${newstateData[stateIndex] == '0' ? 'N/A'
                                      : ' ${int.parse(
                                      newstateData[stateIndex]) -
                                      int.parse(newstateRecov[stateIndex]) -
                                      int.parse(newstateDeath[stateIndex])}'}'),
                            ],
                          ),
                          Divider(height: 10,),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          DataCard2('Cases', cases, newstateData[stateIndex]),
                          DataCard2(
                              'Deaths', deaths, newstateDeath[stateIndex]),

                          DataCard2(
                              'Recovered', recov, newstateRecov[stateIndex]),
                          DataCard2('Active', active,
                              '${newstateData[stateIndex] == '0' ? 'N/A'
                                  : ' ${int.parse(newstateData[stateIndex]) -
                                  int.parse(newstateRecov[stateIndex]) -
                                  int.parse(newstateDeath[stateIndex])}'}'),
                        ],
                      ),
                      if(cases!=recov && cases!=active && cases!=deaths)
                        PieChart(),
                      Divider(height: 10,),
                      Text('District-wise Data',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 230,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey[300]),
                        child:Scrollbar(
                          child:SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child:DataTable(
                              columnSpacing: 1,
                              dataRowHeight: 30,
                              headingRowHeight: 50,
                              horizontalMargin: 10,
                              columns: [
                                DataColumn(label: Text('Districts'),),
                                DataColumn(
                                  label: Text('Cases  '), numeric: true,),
                                DataColumn(
                                  label: Text('Deaths  '), numeric: true,),
                                DataColumn(
                                  label: Text('Recov.  '), numeric: true,),
                              ],
                              rows: [
                                for(int j=0;j<distdata.length;j++)
                                  if(distdata[j]['statecode'].toString().compareTo(stateCode)==0)
                                    for(var i in distdata[j]['districtData'])
                                      DataRow(
                                        cells:[
                                          DataCell(
                                            RichText(
                                              text: TextSpan(
                                                text: '${i['district']}',
                                                style: TextStyle(fontFamily: fontName,
                                                    color: Colors.deepPurple),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            RichText(
                                            text: TextSpan(
                                                text: '${i['confirmed']}',
                                                style: TextStyle(fontFamily: fontName,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '\n${i['delta']['confirmed'] ==
                                                        0
                                                        ? ''
                                                        : ' +${i['delta']['confirmed']}'}',
                                                    style: TextStyle(
                                                        color: Colors.red, fontSize: 12),
                                                  )
                                                ]
                                            ),
                                          ),),
                                          DataCell(
                                            RichText(
                                              text: TextSpan(
                                                  text: '${i['deceased']}',
                                                  style: TextStyle(
                                                      fontFamily: fontName,
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '${i['delta']['deceased'] ==
                                                          0
                                                          ? ''
                                                          : ' \n+${i['delta']['deceased']}'}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    )
                                                  ]
                                              ),
                                            ),),
                                          DataCell(
                                            RichText(
                                              text: TextSpan(
                                                  text: '${i['recovered']}',
                                                  style: TextStyle(
                                                      fontFamily: fontName,
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '${i['delta']['recovered'] ==
                                                          0
                                                          ? ''
                                                          : ' \n+${i['delta']['recovered']}'}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    )
                                                  ]
                                              ),
                                            ),),
                                        ],
//                              onSelectChanged: DataTable(rows: <DataRow>[], columns: <DataColumn>[],),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 10,),
                      Text('District-wise ZONE Data',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 230,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey[300]),
                        child:Scrollbar(
                          child:SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child:DataTable(
                              columnSpacing: 1,
                              dataRowHeight: 30,
                              headingRowHeight: 50,
                              horizontalMargin: 10,
                              columns: [
                                DataColumn(label: Text('Districts'),),
                                DataColumn(label: Text('ZONES'),numeric: true,),
                              ],
                              rows: [
                                for(var j in zone['zones'])
                                  if(j['state'].toString().toLowerCase().compareTo(stateName.toLowerCase())==0)
//                                    for(var i in distdata[j])
                                    DataRow(
                                      cells:[
                                        DataCell(
                                          RichText(
                                            text: TextSpan(
                                              text: '${j['district']}',
                                              style: TextStyle(fontFamily: fontName,
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        ),
                                        DataCell(RichText(
                                          text: TextSpan(
                                            text: '${j['zone']}',
                                            style: TextStyle(fontFamily: fontName,
                                                color: j['zone']=='Orange'?Colors.orange[600]
                                                    :j['zone']=='Red'?Colors.red:Colors.lightGreen[300]),
                                          ),
                                        ),),

                                      ],
//                              onSelectChanged: DataTable(rows: <DataRow>[], columns: <DataColumn>[],),
                                    ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey[300]),
//                      height: 250,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          color: Colors.blueGrey[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LineChart2(allSpots,allSpots2,allSpots3,interval,firstDate,timeline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
class PieChart extends StatelessWidget {


  final data = [
    GradesData('Active', int.parse((active/cases*100).toString().split('.')[0]),charts.ColorUtil.fromDartColor(Colors.redAccent)),
    GradesData('Recov', int.parse((recov/cases*100).toString().split('.')[0]),charts.ColorUtil.fromDartColor(Colors.lightGreen)),
    GradesData('Deaths', int.parse((deaths/cases*100).toString().split('.')[0]),charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
        id: "Grades",
        data: data,
        labelAccessorFn: (GradesData row, _) => '${row.gradeSymbol}:${row.number}%',
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        height: 200,width: double.maxFinite,
        padding: EdgeInsets.all(10),
        child: Card(color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Total data represented in PIE Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
//                  SizedBox(
//                    height: 20,
//                  ),
                Expanded(
                  child: new charts.PieChart(
                    _getSeriesData(),
                    animate: true,
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 200,startAngle: 84,
                        arcRendererDecorators: [new charts.ArcLabelDecorator()]
                    ),
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

