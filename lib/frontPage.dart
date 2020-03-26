import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/helpPage.dart';
// import 'package:flutter_app/world.dart';
import 'package:http/http.dart';
import './helpPage.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

int tcase = 0, recov = 0, death = 0, actcase = 0;
// List<String, dynamic> list = List();
List states = List();
List stateData = List();
List stateDeath = List();
bool firstcall = true;

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    if (firstcall)
      _getThingsOnStartup().then((value) {
        fetchData(); //helpPage().createState().fetchhelpline();
        print('Async done');
        firstcall = false;
      });
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container();
  // }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }

  DateTime now = new DateTime.now();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    // tcase = list.length;
    return Scaffold(
        // appBar: AppBar(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0.0),
          child: RaisedButton(
            color: Colors.blueGrey[200],
            child: new Text(
              "REFRESH\nUpdated on : $now ",
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            onPressed: fetchData,
          ),
        ),

        // ),
        body: isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      strokeWidth: 10,
                    ),
                    Divider(),
                    Text(
                      "Loading...\nUntil then sanitize your hands",
                      softWrap: true,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Divider(),
                      // Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: <Widget>[ Card(
                      //     elevation: 10,
                      //     child: RaisedButton(color:Colors.blueAccent,onPressed:() => Navigator.push(
                      //         context, MaterialPageRoute(builder: (context) =>World())),
                      //     child:Text(
                      //       'World Data',
                      //       softWrap: true,
                      //       style: TextStyle(fontSize: 20),
                      //       textAlign: TextAlign.center,
                      //       ),
                      //     ),),
                      // Card(
                      //   elevation: 10,
                      //   child: RaisedButton(padding: EdgeInsets.all(1),color: Colors.green,onPressed:() => Navigator.push(
                      //       context, MaterialPageRoute(builder: (context) =>helpPage())),
                      //   child:Text(
                      //     'HelpLine Nos.',
                      //     softWrap: true,
                      //     style: TextStyle(fontSize: 20),
                      //     textAlign: TextAlign.center,
                      //     ),
                      //   ),),
                      // ],),
                      // Divider(thickness: 5,color: Colors.black,),
                      Card(
                        // borderOnForeground: true,margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: SelectableText(
                          'All INDIA Tollfree No. - 1075',
                          // softWrap: true,
                          toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              cut: false,
                              paste: false),
                          style: Theme.of(context).textTheme.title,
                          // style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        // borderOnForeground: true,margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: SelectableText(
                          'The Helpline Number for corona-virus : +91-11-23978046',
                          // softWrap: true,
                          toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              cut: false,
                              paste: false),
                          style: Theme.of(context).textTheme.title,
                          // style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Card(
                        // borderOnForeground: true,margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: SelectableText(
                          'More Statewise helpline nos. are here',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => helpPage())),
                          toolbarOptions: ToolbarOptions(
                              copy: true,
                              selectAll: true,
                              cut: false,
                              paste: false),
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                      ),
                      Card(
                        borderOnForeground: true,
                        margin: EdgeInsets.all(0),
                        // color: Colors.orangeAccent[200],
                        child: Text(
                          'India Specific Data',
                          softWrap: true,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                      Divider(thickness: 1, color: Colors.black),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            borderOnForeground: true,
                            elevation: 5,
                            color: Colors.amberAccent,
                            child: Text(
                              ' Total no. of  \n  Corona    Cases  :  \n$tcase',
                              softWrap: true,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Card(
                            borderOnForeground: true,
                            elevation: 5,
                            color: Colors.redAccent[200],
                            child: Text(
                              'Total no.\n   of Deaths :   \n$death',
                              softWrap: true,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Card(
                            borderOnForeground: true,
                            elevation: 5,
                            color: Colors.greenAccent[200],
                            child: Text(
                              'No. of Recovered\nCOVID 2019 cases :\n$recov',
                              softWrap: true,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Card(
                            borderOnForeground: true,
                            elevation: 5,
                            color: Colors.redAccent[100],
                            child: Text(
                              'Active COVID \n2019 cases : \n$actcase',
                              softWrap: true,
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.black,
                      ),
                      Card(
                        borderOnForeground: true,
                        margin: EdgeInsets.all(0),
                        // color: Colors.orangeAccent[200],
                        child: Text(
                          'India\'s Statewise Data',
                          softWrap: true,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Divider(thickness: 1, color: Colors.black),
                      Container(
                        width: double.maxFinite,
                        height: 215,
                        color: Colors.white,
                        padding: EdgeInsets.all(2.0),
                        child: SingleChildScrollView(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                             TableRow(children: [
                                Text(
                                  'States',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Infected',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Deaths',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ]),
                              for (var i = 0; i < states.length; i++)
                                TableRow(children: [
                                  Text(
                                    states[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                              //   ]),
                              // for (var i = 0; i < stateData.length; i++)
                              //   TableRow(children: [
                                  Text(
                                    stateData[i].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                  Text(
                                    stateDeath[i].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  ),
                                ]),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ));
  }

// void fetch(){fetchData();}
  fetchData() async {
    setState(() {
      isLoading = true;
    });
    states = List();
    stateDeath = List();
    stateData = List();
    final Response response = await get("https://api.rootnet.in/covid19-in/stats/latest");
    // final Response helpno = await get("https://covidout.in/helpline");
    if (response.statusCode == 200) {
      var data = response.body;
      // int x = data.indexOf('window.__INITIAL_STATE__');

      // var s = data.substring(x + 27, data.length - 37);
      var list = json.decode(data) ;
      int recover = 0, activeCase = 0, dead = 0,total=0, indiancase = 0,foreigncase = 0;
      recover = list['data']['summary']['discharged'];
      dead = list['data']['summary']['deaths'];
      activeCase = list['data']['summary']['total'];
      foreigncase = list['data']['summary']['confirmedCasesForeign'];
      indiancase = list['data']['summary']['confirmedCasesIndian'];
      total = activeCase + recover + dead;
      tcase = total;
      actcase = activeCase;
      death = dead;
      recov = recover;
      
      for (var stats in list['data']['regional']) {
        states.add(stats['loc']);//+' : '+stats['']);
        stateData.add(stats['confirmedCasesIndian'] + stats['confirmedCasesForeign']);
        stateDeath.add(stats['deaths']);
      }

        // print(stats['loc']);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}
