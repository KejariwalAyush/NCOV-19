import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/helpPage.dart';
import 'package:flutter_app/world.dart';
import 'package:http/http.dart';
import './helpPage.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}
int tcase = 0,recov = 0,death = 0,actcase = 0;
List list = List();
List states = List();
List state = List();

class _FrontPageState extends State<FrontPage> {
  int tcase = 0,recov = 0,death = 0,actcase = 0;
  List list = List();
  List states = List();
  List state = List();
  DateTime now = new DateTime.now();
  
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
      body: isLoading ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
        CircularProgressIndicator(strokeWidth: 10,),Divider(),
        Text("Loading...\nUntill then sanitize your hands",softWrap: true,textAlign: TextAlign.center,)
      ],),):
      Container(child:
      SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Divider(),
            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[ Card(
                elevation: 10,              
                child: RaisedButton(color:Colors.blueAccent,onPressed:() => Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>World())),
                child:Text(
                  'World Data',
                  softWrap: true,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  ),
                ),),
            Card(
              elevation: 10,
              child: RaisedButton(padding: EdgeInsets.all(1),color: Colors.green,onPressed:() => Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>helpPage())),
              child:Text(
                'HelpLine Nos.',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                ),
              ),),
            ],),
            Divider(thickness: 5,color: Colors.black,),
            Card(
              // borderOnForeground: true,margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                'All INDIA Tollfree No. - 1075',
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
                margin: EdgeInsets.all(0),
                // color: Colors.orangeAccent[200],
                child: Text(
                  'India Specific Data',
                  softWrap: true,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,textWidthBasis: TextWidthBasis.parent,
                  ),
                ),
            Divider(thickness: 1,color: Colors.black),
            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
            Card(
              borderOnForeground: true,
              // margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Text(
                ' Total no. of \n   Corona Cases  :  \n$tcase',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              // margin: EdgeInsets.all(10),
              color: Colors.redAccent[200],
              child: Text(
                'Total no.\n    of Deaths :    \n$death',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ],),
            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
            Card(
              borderOnForeground: true,
              // margin: EdgeInsets.all(10),
              color: Colors.redAccent[100],
              child: Text(
                'Active COVID \n2019 cases : \n$actcase',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              // margin: EdgeInsets.all(10),
              color: Colors.greenAccent[200],
              child: Text(
                'No. of Recovered\nCOVID 2019 cases : \n$recov',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
              ],),
            Divider(thickness: 5,color: Colors.black,),
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
              Divider(thickness: 1,color: Colors.black),
              Container(width: double.maxFinite,height: 220,
              color: Colors.white,
              padding: EdgeInsets.all(2.0),
              child: SingleChildScrollView(child: Table(
                // border: TableBorder.all(color: Colors.),
                children: [
                  // TableRow(children: [
                  //   Text('States : Infected',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  // ]),
                  for (var i = 0; i < states.length; i++)
                  TableRow(children: [
                    Text(states[i].toString().trim(),textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20),),
                  ]),
                ],
              ),),
            ),
              Divider(thickness: 5,color: Colors.black,),
              
              

          ],
        ),
      ),
    )
    );
  }
_fetchData() async {
    setState(() {
      isLoading = true;
    });
    states = List();state = List();
    final Response response =
        await get("https://covidout.in/");
    // final Response helpno = await get("https://covidout.in/helpline");
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
        stcnt = states[i];
        states[i] = "$stcnt : $n";
      }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}