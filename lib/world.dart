
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class World extends StatefulWidget {
  // Color cardColor = Colors.lightBlueAccent[100];
  @override
  _WorldState createState() => _WorldState();
}
String totcase =null,detcase=null,seriouscase=null,curecase=null,countries=null;
List cList = List(),casesList= List(),deathList = List(),recoverList = List();

var loadfailed = false;
bool firstcall = true;

class _WorldState extends State<World> {
    @override
  void initState() {
    _getThingsOnStartup().then((value){
      try {
            fetchworld();
          } on Exception catch (e) {
            print(e);
      }

      print('Async done');firstcall=false;
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
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    // CVapi();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'NCOV-19 (World Stats)',
      //     style: TextStyle(color: Colors.white, fontSize: 20),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.lightBlueAccent,
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: new Icon(Icons.arrow_back_ios),
      //       onPressed: () => Navigator.pop(context,false),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: RaisedButton(color: Colors.blueGrey[200],
          child: new Text("REFRESH",softWrap: true,textAlign: TextAlign.center,),
          onPressed: fetchworld,
        ),
      ),
      body: isLoading ? loadfailed ? Center(child:Text('Faild to load try after some time')):
      Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
        CircularProgressIndicator(strokeWidth: 10,),Divider(),
        Text("Loading...\nUntil then sanitize your hands",softWrap: true,textAlign: TextAlign.center,)
      ],),):
       SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Divider(),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Text(
                'Total no. of Corona Cases : \n$totcase',
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
                'Total no. of Deaths : \n$detcase',
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
                'Serious COVID 2019 cases : \n$seriouscase',
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
                'Discharged/Cured COVID 2019 cases : \n$curecase',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Text(
                'No. of Countries Affected : \n$countries',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(thickness: 5,color: Colors.black,),
            Card(
              borderOnForeground: true,
              // margin: EdgeInsets.all(10),
              // color: Colors.amberAccent,
              child: Text(
                'Countries List',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            // Divider(),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(1),
              // color: Colors.amberAccent,
              child: Text(
                '*all countries are not updated together\n(it may take time to show actual data)',
                softWrap: true,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            Container(width: double.maxFinite,height: 350,
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Text('Countries',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('Infected',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('Deaths',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ]),
                  for (var i = 0; i < cList.length-10; i++)
                  TableRow(children: [
                    Text(cList[i].toString().trim(),textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 16),),
                    Text(casesList[i].toString().trim(),textAlign: TextAlign.center,style: TextStyle(color: Colors.blueAccent,fontSize: 16),),
                    Text(deathList[i].toString().trim(),textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent,fontSize: 16),),
                    // Text(recoverList[0].toString().trim(),textAlign: TextAlign.center,),
                  ]),
                ],
              ),),
            ),
            Divider(thickness: 5,color: Colors.black,)
            // Container(
            //   width: double.maxFinite,height: 300,padding: EdgeInsets.all(2),
            //   child: 
            // SingleChildScrollView(
            //     child: Column(
            //       children: <Widget>[
            //         for (var i = 0; i < cList.length; i++)
            //           Row(//crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,//mainAxisSize: MainAxisSize.max,
            //             children: <Widget>[
            //             Text(cList[i],textAlign: TextAlign.center,style: TextStyle(color: Colors.black),softWrap: true,),
            //             Text(casesList[i],textAlign: TextAlign.center,style: TextStyle(color: Colors.lightBlue),softWrap: true,),
            //             Text(deathList[i],textAlign: TextAlign.end,style: TextStyle(color: Colors.redAccent),softWrap: true,),
            //           ],),
            //       ],
            //     ),
            //     ),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Text(
      //     'Updated on : 17.03.2020 at 05:15 PM ',
      //     softWrap: true,
      //     style: TextStyle(fontSize: 16),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    );
  }

  fetchworld() async {
    setState(() {
      isLoading = true;
    });
    
    final Response response = await get("https://ncov2019.live/data");
    if (response.statusCode == 200) {
      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('p');
      List<Map<String, dynamic>> linkMap = [];
      for (var link in links) {
        linkMap.add({
          'title': link.text,
        });
      }      
      var enc = json.encode(linkMap);
      List worlddata = jsonDecode(enc);
      totcase = worlddata[3]['title'].toString().trim();
      detcase = worlddata[5]['title'].toString().trim();
      seriouscase = worlddata[7]['title'].toString().trim();
      curecase = worlddata[9]['title'].toString().trim();
      countries = worlddata[11]['title'].toString().trim();

      List cnts = document.querySelectorAll('tr > td');
      List<Map<String, dynamic>> cntMap = [];
      for (var cnt in cnts) {
        cntMap.add({
          'title': cnt.text,
        });
      }
      var encode = json.encode(cntMap);
      List cntdata = jsonDecode(encode);
      // print(cntdata[5]);   
      for (var i = 0; i < cntdata.length; i+=5) {
        cList.add(cntdata[i]['title'].toString().trim());
        casesList.add(cntdata[i+1]['title'].toString().trim());
        deathList.add(cntdata[i+2]['title'].toString().trim());
        recoverList.add(cntdata[i+3]['title'].toString().trim());
      }

      setState(() {
        isLoading = false;
      });
    } else {loadfailed = true;
      Exception('Failed to load');
    }
  }
}
