import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/home.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:package_info/package_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data.dart';

//import 'data.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

//var version = 1.0;
List newslink = List();
List newslist = List();
List newsdate = List();
List newssubhead = List();
List newsAllData = List();

int tcaseind = 0, recovind = 0, deathind = 0, actcaseind = 0,newtcaseind=0,newrecovind=0,newdeathind=0;
List states = List(),statesCode = List(),stateTimeUpdate = List();
List stateData = List(),newstateData = List();
List stateDeath = List(),newstateDeath = List();
List stateRecov = List(),newstateRecov = List();
List dates = List();
List days = List();
int day=0;
List datecases = List();
List datetotcase = List();
List datedeath = List();
List daterecov = List();
List datetotdeath = List();
List datetotrecov = List();
int one=0,two=0,three=0,four=0,five=0;
//DateTime dateTime ;
var lastupdatetime;
var male=0,female=0;
List age = List();

var indAllData = List();
var distdata;
var diststates;
var zone,statesDaily;

var world;
var continent;
var worldHistory;
var countryData;
int tcasewld =0,
    deathwld =0,
    recovwld =0,
    actcasewld =0,
    newtcasewld=0,
    newrecovwld=0,
    newdeathwld=0;

List contries = List(),
    casescont = List(),
    newcasecont = List(),
    deathcont = List(),
    newdeathcont = List(),
    recovercont = List();

List state = List();
List phone = List();

String appName = 'NCOV-19';
String packageName ;
String version = '1.0';
String buildNumber ;
String updatelink;
String latestversion ;
bool isUpdateAvailable = false;


bool firstcall = true;
DateTime now = new DateTime.now();

var indiaData,newsData,worldData;

class _SplashState extends State<Splash> {
  bool noInternet = false;

  @override
  void initState() {
    _getThingsOnStartup().then((value) async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
        }
      } on SocketException catch (_) {
        print('not connected');
        noInternet = true;
        Alert(
          context: context,
          closeFunction: ()=>{SystemNavigator.pop()},
          type: AlertType.warning,
          title: "Internet Unavailable !!",
          desc: "Check your internet connection please.",
          buttons: [
            DialogButton(
              child: Text(
                "Retry",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => Splash()))},
              color: Color(0xFF333366),
            ),
            DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => SystemNavigator.pop(),
              color: Colors.blueGrey,
            )
          ],
        ).show();
      }
      fetchupdate();
      DataSource().fetchnews();
      DataSource().fetchData();
      DataSource().fetchworld();
      DataSource().fetchhelpline();
      DataSource().fetchnews();
      print('Async done');firstcall = false;
//      setData();
    });
    super.initState();
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }

  int sec = 15;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return noInternet?Center():SplashScreen(
      seconds: 11,
      //isLoading?sec:1,
      navigateAfterSeconds:noInternet?Center():Frontpg(),
      title: new Text('NCOV-19\n A covid-19 tracker',textAlign: TextAlign.center,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.white70,
        ),
      ),
      image: new Image.asset('assets/backg.png',
        width: double.maxFinite,fit: BoxFit.fitWidth,
      ),
      backgroundColor: Colors.redAccent,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 180.0,
      loaderColor: Colors.white,
      loadingText: Text('LOADING...\nUntil then Sanitize Your Hands!\n\nVersion: $version',textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Comic Sans MS',color: Colors.white70,fontSize: 16),),
    );
  }

  fetchupdate() async {
    setState(() {
      isLoading = true;
    });
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;

    final Response response = await get('https://github.com/KejariwalAyush/NCOV-19/releases/latest');
    if (response.statusCode == 200) {
//      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('div > ul > li > a > span ');
      List<Map<String, String>> linkMap = [];
      for (var link in links) {
        linkMap.add({
          'title': link.text,
        });
      }
      var dec = jsonDecode(json.encode(linkMap));
      latestversion = dec[6]['title'];
      print(latestversion);

      List links2 = document.querySelectorAll('details > div > div > div > a');
      List<Map<String, String>> linkMap2 = [];
      for (var link in links2) {
        linkMap2.add({
          'title': 'https://github.com'+link.attributes['href'],
        });
      }
      var dec2 = jsonDecode(json.encode(linkMap2));
      updatelink = dec2[0]['title'];
      print(updatelink);

      if(version.compareTo(latestversion)!=0){
        print('update available');
        isUpdateAvailable=true;

        showSimpleNotification(
          Text("Update available version: $latestversion"),
          background: Colors.redAccent,
          autoDismiss: false,slideDismiss: true,
          trailing: Builder(builder: (context) {
            return FlatButton(
                textColor: Colors.yellow,
                onPressed: ()=> {
                  _launchURL(updatelink),
                },
                child: Text('UPDATE'));
          }),
        );
        print(version);
        Alert(
          context: context,
          type: AlertType.none,
          title: "UPDATE Available!",
          desc: "Version: $latestversion\nAfter downloading apk install it.",
          buttons: [
            DialogButton(
              child: Text(
                "UPDATE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => {_launchURL(updatelink)},
              color: Color(0xFF333366),
            ),
//            DialogButton(
//              child: Text(
//                "Cancel",
//                style: TextStyle(color: Colors.white, fontSize: 20),
//              ),
//              onPressed: () => Navigator.pop(context),
//              color: Colors.blueGrey,
//            )
          ],
        ).show();
      }
      else {
        print('Up-to-Date');
        isUpdateAvailable = false;
      }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }

  _launchURL(String url) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    return;
  }

//  void _showDialog() {
//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("UPDATE Available"),
//          content: new Text("Download & install latest version of the app\nUpdates make your app better"),
//          actions: <Widget>[
//            new FlatButton(onPressed: _launchURL(updatelink),
//                child: new Text('Update',style: TextStyle(color: Colors.blueAccent,),)),
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