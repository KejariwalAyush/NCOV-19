

import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Countries.dart';
import 'package:http/http.dart';

import 'splash.dart';

String newContName1,newContName2;
var data1,data2;
var timeline,timeline2;
var intervals,intervals2;
bool isLoading = false,
    isLoading2 = false;
int no1,no2;
List<FlSpot> allSpots, allSpots2, allSpots3,allSpots4, allSpots5, allSpots6;

// ignore: must_be_immutable
class Compare extends StatefulWidget {
  String name1,name2;
  Compare(this.name1,this.name2)
  {
    newContName1 = name1;
    newContName2 = name2;
  }

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  final String fontName = 'Comfortaa';
  var data;
  var allSpots, allSpots2, allSpots3;
  bool moreData = false;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < countryData.length; i++) {
      if (countryData[i]['country']
          .toString()
          .toLowerCase()
          .compareTo(newContName1.toString().toLowerCase()) ==
          0) {
        data1 = fetch(countryData[i]['country']);
        no1 = i;
        }
      if (countryData[i]['country']
          .toString()
          .toLowerCase()
          .compareTo(newContName2.toString().toLowerCase()) ==
          0) {
        data2 = fetch(countryData[i]['country']);
        no2 = i;
      }
    }
    setState(() {
      data1 = fetch(countryData[no1]['country']);
      data2 = fetch2(countryData[no2]['country']);
    });
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        elevation: 20,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[100]),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.all(2),
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
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Divider(
                            height: 10,
                          ),
                          Image.network(
                            countryData[no1]['countryInfo']['flag'],
                            height: 50,
                          ),
                          Text(
                            '${countryData[no1]['country']}',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 10,
                          ),
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Cases:\nRecovered:\nDeaths:\nActive:\nCritical:\n\nYesterday Cases:\nYesterday Deaths:\nCases/Million:\nDeaths/Million:',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white70),
                                ),
                                Text(
                                  '${countryData[no1]['cases']}'
                                      '\n${countryData[no1]['recovered']}\n${countryData[no1]['deaths']}'
                                      '\n${countryData[no1]['active']}\n${countryData[no1]['critical']}\n'
                                      '\n+${countryData[no1]['todayCases']}\n+${countryData[no1]['todayDeaths']}'
                                      '\n${countryData[no1]['casesPerOneMillion']}\n${countryData[no1]['deathsPerOneMillion']}',
                                  textAlign: TextAlign.end,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Divider(
                            height: 10,
                          ),
                          Image.network(
                            countryData[no2]['countryInfo']['flag'],
                            height: 50,
                          ),
                          Text(
                            '${countryData[no2]['country']}',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 10,
                          ),
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
//                              Text(
//                                'Cases:\nRecovered:\nDeaths:\nActive:\nCritical:\n\nYesterday Cases:\nYesterday Deaths:\nCases/Million:\nDeaths/Million:',
//                                textAlign: TextAlign.start,
//                                softWrap: true,
//                                style: TextStyle(
//                                    fontSize: 20, color: Colors.white70),
//                              ),
                                Text(
                                  '${countryData[no2]['cases']}'
                                      '\n${countryData[no2]['recovered']}\n${countryData[no2]['deaths']}'
                                      '\n${countryData[no2]['active']}\n${countryData[no2]['critical']}\n'
                                      '\n+${countryData[no2]['todayCases']}\n+${countryData[no2]['todayDeaths']}'
                                      '\n${countryData[no2]['casesPerOneMillion']}\n${countryData[no2]['deathsPerOneMillion']}',
                                  textAlign: TextAlign.end,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 5,),
              isLoading && isLoading2 ? CircularProgressIndicator(
                backgroundColor: Colors.redAccent,)
                  : orientation == 0 ?
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey[300]),
                    padding: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.blueGrey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text('$newContName1', textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),),
                            LineChart2(
                                allSpots, allSpots2, allSpots3, intervals,
                                firstCase, timeline),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 5,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey[300]),
                    padding: EdgeInsets.all(10),
                    child: Card(
                      color: Colors.blueGrey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text('$newContName2', textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),),
                            LineChart2(
                                allSpots4, allSpots5, allSpots6, intervals2,
                                firstCase2, timeline2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey[300]),
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: Colors.blueGrey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text('$newContName1', textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20),),
                              LineChart2(
                                  allSpots, allSpots2, allSpots3, intervals,
                                  firstCase, timeline),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
//                  Divider(height: 5,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueGrey[300]),
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: Colors.blueGrey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text('$newContName2', textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20),),
                              LineChart2(
                                  allSpots4, allSpots5, allSpots6, intervals2,
                                  firstCase2, timeline2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  DateTime firstCase;
  fetch(String countryName) async {
    setState(() {
      isLoading = true;
    });
    final Response resp =
    await get("https://disease.sh/v2/historical/$countryName?lastdays=all");
    if (resp.statusCode == 200) {
      var db = resp.body;
      var data = jsonDecode(db);
      data1 = data;
  //    print(data);
  //      timeline = 0;
      allSpots = null;allSpots2 = null;allSpots3 = null;
      int cnt1 = 0;
      var d = data['timeline']['cases'].keys.toString().substring(1, 9);
      firstCase = DateTime(
          2020, int.parse(d.split('/')[0]), int.parse(d.split('/')[1]));
  //      print(firstCase);
      allSpots = [
        for (var i in data['timeline']['cases'].keys)
          FlSpot(double.parse((cnt1++).toString()),
              double.parse(data['timeline']['cases'][i].toString())),
      ];
      int cnt2 = 0;
      allSpots2 = [
        for (var i in data['timeline']['cases'].keys)
          FlSpot(double.parse((cnt2++).toString()),
              double.parse(data['timeline']['recovered'][i].toString())),
      ];
      int cnt3 = 0;
      allSpots3 = [
        for (var i in data['timeline']['cases'].keys)
          FlSpot(double.parse((cnt3++).toString()),
              double.parse(data['timeline']['deaths'][i].toString())),
      ];
      intervals = countryData[no1]['cases'] / 4;
      timeline=cnt1;
      setState(() {
        isLoading = false;
      });
  //    print(allSpots3);
      return data;
    } else
      return null;
  }
  DateTime firstCase2;
  fetch2(String countryName) async {
    setState(() {
      isLoading2 = true;
    });
    final Response resp =
    await get("https://disease.sh/v2/historical/$countryName?lastdays=all");
    if (resp.statusCode == 200) {
      var db = resp.body;
      var data = jsonDecode(db);
      data2 = data;
      //    print(data);
      //      timeline = 0;
      allSpots4 = null;allSpots5 = null;allSpots6 = null;
      int cnt1 = 0;
      var d = data['timeline']['cases'].keys.toString().substring(1, 9);
      firstCase2 = DateTime(
          2020, int.parse(d.split('/')[0]), int.parse(d.split('/')[1]));
      //      print(firstCase);
      allSpots4 = [
        for (var i in data['timeline']['cases'].keys)
          FlSpot(double.parse((cnt1++).toString()),
              double.parse(data['timeline']['cases'][i].toString())),
      ];
      int cnt2 = 0;
      allSpots5 = [
        for (var i in data['timeline']['cases'].keys)
          FlSpot(double.parse((cnt2++).toString()),
              double.parse(data['timeline']['recovered'][i].toString())),
      ];
      int cnt3 = 0;
      allSpots6 = [
        for (var i in data['timeline']['cases'].keys)
          FlSpot(double.parse((cnt3++).toString()),
              double.parse(data['timeline']['deaths'][i].toString())),
      ];
      intervals2 = countryData[no2]['cases'] / 4;
      timeline2=cnt1;
      setState(() {
        isLoading2 = false;
      });
      //    print(allSpots3);
      return data;
    } else
      return null;
  }
}