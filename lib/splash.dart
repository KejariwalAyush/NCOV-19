import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

var version = 1.0;
List newslink = List();
List newslist = List();

int tcaseind = 0, recovind = 0, deathind = 0, actcaseind = 0;
List states = List();
List stateData = List();
List stateDeath = List();
List stateRecov = List();
List dates = List();
List datecases = List();
List datetotcase = List();

int tcasewld =0,
    deathwld =0,
    recovwld =0,
    actcasewld =0;
//List contries = List(),
//    casescont = List(),
//    deathcont = List(),
//    recovercont = List();

List state = List();
List phone = List();

bool firstcall = true;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _getThingsOnStartup().then((value){
//      fetchupdate();
      fetchData();
      fetchnews();
      fetchworld();
      fetchhelpline();
      print('Async done');firstcall = false;
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
    return new SplashScreen(
        seconds: 7,
        navigateAfterSeconds: new Frontpg(),
        title: new Text('NCOV-19\n A covid-19 tracker',textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white70,
          ),
        ),
        image: new Image.asset('assets/backround1.png',
          width: double.maxFinite,fit: BoxFit.fitWidth,
        ),
        backgroundColor: Colors.redAccent,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 180.0,
//        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.white,
        loadingText: Text('LOADING...\nUntil then Sanitize Your Hands!',textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Comic Sans MS',color: Colors.white70,fontSize: 16),),
    );
  }

  fetchData() async {
    setState(() {
      isLoading = true;
    });

    final Response response = await get("https://api.covid19india.org/data.json");
    // final Response helpno = await get("https://covidout.in/helpline");
    if (response.statusCode == 200) {
      states = List();
      stateDeath = List();
      stateData = List();
      stateRecov = List();
      dates = List();
      datecases = List();
      datetotcase = List();
      var data = response.body;
      var inddata = jsonDecode(data);

//      print(inddata['statewise'][0]['active']);
      tcaseind = int.parse(inddata['statewise'][0]['confirmed']);
      actcaseind = int.parse(inddata['statewise'][0]['active']);
      deathind = int.parse(inddata['statewise'][0]['deaths']);
      recovind = int.parse(inddata['statewise'][0]['recovered']);
      for(var i in inddata['statewise'])
        {
          states.add(i['state']);
          stateData.add(i['confirmed']);
          stateDeath.add(i['deaths']);
          stateRecov.add(i['recovered']);
        }
      for(var i in inddata['cases_time_series'])
        {
          dates.add(i['date']);
          datecases.add(i['dailyconfirmed']);
          datetotcase.add(i['totalconfirmed']);
        }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }

  fetchnews() async {
    setState(() {
      isLoading = true;
    });

    final Response response = await get("https://indianexpress.com/about/coronavirus/");
    if (response.statusCode == 200) {
      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('h3 > a');
      List<Map<String, dynamic>> linkMap = [];
      // print(linkMap);
      for (var link in links) {
        linkMap.add({
          'title': link.text,
          'link': link.attributes['href'],
        });
      }
      newslink = List();
      newslist = List();
      var enc = json.encode(linkMap);
      List newsdata = jsonDecode(enc);
      // print(x.split(new RegExp(r"[a-z]")));//[x.split(new RegExp(r"[a-z]")).length-1]);
      // String x = newsdata[1]['link'];
      // print(x);
      // int i=22;
      for (var i = 0; i < newsdata.length; i++) {
        newslist.add(newsdata[i]['title']);
        newslink.add(newsdata[i]['link']);
      }
      // while(i<30) {
      //   newslist.add(x);
      //   x=newsdata[i]['title'];
      //   i++;//print(x);
      // }
    setState(() {
      isLoading = false;
    });
    } else {
      throw Exception('Failed to load');
    }
  }

  fetchworld() async {
    setState(() {
      isLoading = true;
    });

    final Response response = await get("https://www.worldometers.info/coronavirus/");
    if (response.statusCode == 200) {
//      tcasewld=0; deathwld=0; recovwld =0; actcasewld =0;
      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('#maincounter-wrap > div > span');
      List<Map<String, dynamic>> linkMap = [];
      for (var link in links) {
        linkMap.add({
          'title': link.text,
        });
      }
      var enc = json.encode(linkMap);
      List worlddata = jsonDecode(enc);
      tcasewld = int.parse(worlddata[0]['title'].toString().replaceAll(',', ''));
      deathwld = int.parse(worlddata[1]['title'].toString().replaceAll(',', ''));
      recovwld = int.parse(worlddata[2]['title'].toString().replaceAll(',', ''));
      actcasewld = tcasewld-deathwld-recovwld;
//      for(int i=2;i<22;i++) {
//        List links2 = document.querySelectorAll(
//            '#main_table_countries_today > tbody:nth-child(2) > tr:nth-child($i) > td');
//        List<Map<String, dynamic>> linkMap2 = [];
//        for (var link in links) {
//          linkMap.add({
//            'title': link.text,
//          });
//        }
//        var enc2 = json.encode(linkMap);
//        List contdata = jsonDecode(enc);
//
////        print(contdata);
//      }
      setState(() {
        isLoading = false;
      });
    } else {
//      loadfailed = true;
      Exception('Failed to load');
    }
  }

  fetchhelpline() async {
    setState(() {
      isLoading = true;
    });

    final Response response = await get("https://api.rootnet.in/covid19-in/contacts");
    if (response.statusCode == 200) {
      state = List();phone = List();
      var list = json.decode(response.body) ;
//      print(list['data']);

      for (var stats in list['data']['contacts']['regional']) {
        state.add(stats['loc']);//+' : '+stats['']);
        phone.add(stats['number']);
        // stateDeath.add(stats['deaths']);
      }

      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }

//  fetchupdate() async {
////    setState(() {
////      isLoading = true;
////    });
//
//    final Response response = await get('https://github.com/KejariwalAyush/NCOV-19/releases/latest');
//    if (response.statusCode == 200)
////    {
//      var data = response.body;
//      if(version< )
//      _showDialog();
//
////      setState(() {
////        isLoading = false;
////      });
////    } else {
////      throw Exception('Failed to load');
////    }
//  }

//  _launchURL(String url) async {
//    // const url = 'https://flutter.dev';
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//    return;
//  }

//  void _showDialog() {
//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("UPDATE Available"),
//          content: new Text("Download & install latest version of the app"),
//          actions: <Widget>[
//            new FlatButton(onPressed: _launchURL('https://github.com/KejariwalAyush/NCOV-19/blob/master/app-release.apk?raw=true'),
//                child: new Text('Update',style: TextStyle(color: Colors.blueAccent,),))
//            // usually buttons at the bottom of the dialog
//            new FlatButton(
//              child: new Text("Cancel"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

}