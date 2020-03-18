import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int tcase = 0,recov = 0,death = 0,actcase = 0;
  DateTime now = new DateTime.now();
  List list = List();
  List states = List();
  List state = List();
  List stt_cnt = List();
  // List<int> noState = List();
  
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    // _fetchData();
    // tcase = list.length;
    return Scaffold(
      // appBar: AppBar(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: RaisedButton(color: Colors.blueGrey[200],
          child: new Text("REFRESH\nUpdated on : $now ",softWrap: true,textAlign: TextAlign.center,),
          onPressed: _fetchData,
        ),

      ),

      // ),
      body: isLoading ? Center(child: CircularProgressIndicator()):
      Container(child:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Divider(),
            Card(
              // borderOnForeground: true,margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                'Tollfree No. - 1075',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              // borderOnForeground: true,margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                'The Helpline Number for corona-virus : +91-11-23978046',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 5,
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(1),
              color: Colors.black12,
              child: Text(
                'OverAll Data',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                ),
              ),
              Divider(thickness: 1,color: Colors.black),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Text(
                'Total no. of Corona Cases in India : \n$tcase',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.redAccent[200],
              child: Text(
                'Total no. of Deaths in India : \n$death',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.redAccent[100],
              child: Text(
                'Total number of Active COVID 2019 cases across India * : \n$actcase',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.greenAccent[200],
              child: Text(
                'Total number of Discharged/Cured COVID 2019 cases across India * : \n$recov',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(thickness: 5,color: Colors.black,),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(1),
              color: Colors.black12,
              child: Text(
                'Statewise Data',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                ),
              ),
              Divider(thickness: 1,color: Colors.black),
            for (var st in states)
              Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(0),
              color: Colors.white,
              child: Text(
                '$st',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.end,
                ),
              ),
          ],
        ),
      ),
    )
    );
  }
_fetchData() async {
  // list = null;state = null;states = null;stt_cnt = null;
    setState(() {
      isLoading = true;
    });
    states = List();state = List();
    final Response response =
        await get("https://covidout.in/");
    if (response.statusCode == 200) {
      var data = response.body;
      int x = data.indexOf('window.__INITIAL_STATE__');
      
      var s = data.substring(x+27,data.length-37);
      list =  json.decode(s) as List;
      tcase = list.length;
      int recover=0,activeCase=0,dead=0;
      bool isThere = false;
      for (var cases in list) {
        for (var i in states) {
          if(i == cases["state"])
            {isThere = true;break;}
          isThere = false;
        }

        if(isThere == false)
          states.add(cases["state"]);
        state.add(cases["state"]);

        if(cases["status"] == "RECOVERED")
          recover++;
        else if(cases["status"] == "HOSPITALIZED")
          activeCase++;
        else if(cases["status"] == "DIED")
          dead++;
        // else if(cases["state"] == )
      }
      actcase = activeCase;death = dead;recov = recover;
      String stcnt;
      for (var i = 0; i < states.length; i++) 
      {
        int n=0;
        for(int j=0;j<state.length;j++){
          if(state.contains(states[i]))
          {
            state.remove(states[i]);
            n++;
          }
        }
          print(n);
        // if(states.contains()){
        stcnt = states[i];
        states[i] = "$stcnt : \t\t\t\t\t\t$n";
        // states.remove(i);
        // states.add(stcnt);
        // print(states[i]);
      }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}