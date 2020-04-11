import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:package_info/package_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

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
List states = List();
List stateData = List(),newstateData = List();
List stateDeath = List(),newstateDeath = List();
List stateRecov = List(),newstateRecov = List();
List dates = List();
List datecases = List();
List datetotcase = List();
var lastupdatetime;

var indAllData = List();
var distdata;
var diststates;

int tcasewld =0,
    deathwld =0,
    recovwld =0,
    actcasewld =0,
    newtcasewld=0,
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

  @override
  void initState() {
    _getThingsOnStartup().then((value){

      fetchupdate();
      fetchnews();
      fetchData();
      fetchworld();
      fetchhelpline();
      fetchnews();
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
    // TODO: implement build
    return SplashScreen(
      seconds: 8,//isLoading?sec:1,
      navigateAfterSeconds:Frontpg(),
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
      loadingText: Text('LOADING...\nUntil then Sanitize Your Hands!\n\nVersion: $version',textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Comic Sans MS',color: Colors.white70,fontSize: 16),),
    );
  }

  fetchData() async {
    setState(() {
      isLoading = true;
    });

    final Response response = await get("https://api.covid19india.org/data.json");
    final Response response2 = await get("https://api.covid19india.org/v2/state_district_wise.json");
    // final Response helpno = await get("https://covidout.in/helpline");
    if (response.statusCode == 200 && response2.statusCode == 200) {
      states = List();
      stateDeath = List();
      stateData = List();
      stateRecov = List();
      dates = List();
      datecases = List();
      datetotcase = List();

//      indAllData = List();

      var data = response.body;
      var inddata = jsonDecode(data);

      var data2 = response2.body;
//      var stdata =
      distdata=jsonDecode(data2);
//      distdata = stdata;
//      print(distdata['state'].indexOf('Kerala').toString());
//      for(var i in stdata)
//        diststates.add(i);
//      print(diststates[0]);
      indiaData = inddata;

//      print(inddata['statewise'][0]['active']);
      lastupdatetime = inddata['statewise'][0]['lastupdatedtime'];
      tcaseind = int.parse(inddata['statewise'][0]['confirmed']);
      newtcaseind =  int.parse(inddata['statewise'][0]['deltaconfirmed']);
      actcaseind = int.parse(inddata['statewise'][0]['active']);
      deathind = int.parse(inddata['statewise'][0]['deaths']);
      recovind = int.parse(inddata['statewise'][0]['recovered']);
      newdeathind = int.parse(inddata['statewise'][0]['deltadeaths']);
      newrecovind = int.parse(inddata['statewise'][0]['deltarecovered']);
      for(var i in inddata['statewise'])
      {
        states.add(i['state']);
        stateData.add(i['confirmed']);
        stateDeath.add(i['deaths']);
        stateRecov.add(i['recovered']);
        newstateData.add(i['deltaconfirmed']);
        newstateDeath.add(i['deltadeaths']);
        newstateRecov.add(i['deltarecovered']);
      }
      for(var i in inddata['cases_time_series'])
      {
        dates.add(i['date']);
        datecases.add(i['dailyconfirmed']);
        datetotcase.add(i['totalconfirmed']);
      }

//      List<Map<String,String>>

//      distdata[dropdownvalue]['districtData'][i]
//      List<Map<String,dynamic>> indDataMap =[
//        {'overall':inddata['statewise'][0],
//          'statewise':[
//            for(int i=1;i< states.length;i++){
//              'state': states[i],
//              'confirmed': stateData[i],
//              'death': stateDeath[i],
//              'recovered': stateRecov[i],
//              'newconfirmed': newstateData[i],
//              'newdeath': newstateDeath[i],
//              'newrecovered': newstateRecov[i],
////              'districtdata': stateData[i]=='0'?null:stdata['${states[i].toString()}']['districtData'],
//            },
//          ],
//          'districtwisedata': stdata,
//          'timewisedata':inddata['cases_time_series'],
//        },
//      ];
//      var encode = json.encode(indDataMap.toString());
//      indAllData = jsonDecode(encode);
//      print(indAllData);
//      print(indAllData[0]['overall']);
//      print(states[1]);
//      print(stdata['${states[1].toString()}']['districtData']);

      setState(() {
        print('india data fetched');
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
      newsAllData = List();
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
      newsData = newsdata;
      for (var i = 0; i < newsdata.length; i++) {
        newslist.add(newsdata[i]['title']);
        newslink.add(newsdata[i]['link']);
      }

      List links2 = document.querySelectorAll('div > p');
      List<Map<String, String>> linkMap2 = [];
      // print(linkMap);
      for (var link in links2) {
        linkMap2.add({
          'title': link.text,
        });
      }
      var enc2 = json.encode(linkMap2);
      List newsdata2 = jsonDecode(enc2);
      for (var i = 0; i < newsdata.length; i+=2) {
        newsdate.add(newsdata2[i]['title']);
        newssubhead.add(newsdata2[i+1]['title']);
      }

      List links3 = document.querySelectorAll('div.details > div.about-thumb > a > noscript ');
      List img = [];
      for(var link in links3) {
        String x = link.text;
//        print(x);
        if(x.contains('class'))
          img.add(x.substring(x.indexOf('src')+5,x.indexOf('class')-2));
        else
          img.add(null);
      }
//      print(img);

      List<Map<String,String>> newsMap = [];
      for(int i=0;i<newsdata.length;i++)
        newsMap.add({
          'title': newslist[i],
          'link': newslink[i],
          'date': newsdate[i],
          'info': newssubhead[i],
          'image': img[i],
        });
      var encodeNews = json.encode(newsMap);
      newsAllData = jsonDecode(encodeNews);
//      print(newsAllData);
//      if(newsAllData.length!=0)

      setState(() {
        print('news fetched');
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
      worldData = worlddata;

      tcasewld = int.parse(worlddata[0]['title'].toString().replaceAll(',', ''));
      deathwld = int.parse(worlddata[1]['title'].toString().replaceAll(',', ''));
      recovwld = int.parse(worlddata[2]['title'].toString().replaceAll(',', ''));
      actcasewld = tcasewld-deathwld-recovwld;

      List linkcont = document.querySelectorAll(
          'tr');
      List<Map<String, dynamic>> linkMap2 = [];
      for (var link in linkcont) {
//        if(link%12!=0)
//          link++;
        linkMap2.add({
          'title': link.text.toString().split('\n')[1],
          'cases': link.text.toString().split('\n')[2],
          'newcase': link.text.toString().split('\n')[3],
          'deaths': link.text.toString().split('\n')[4],
          'newdeath':link.text.toString().split('\n')[5],
          'recovered': link.text.toString().split('\n')[6],
//           'activecase':link.text,
//           'serious':link.text,
//           'cases/1M':link.text,
//           'death/1M': link.text,
//           'tests':link.text,
//           'tests/1M':link.text,
        });
      }
      var enc2 = json.encode(linkMap2);
      List contname = jsonDecode(enc2);
//       newtcasewld = contname[1]['newcase'];
//       newdeathwld = contname[1]['newdeath'];
      for(var i in contname) {
        contries.add(i['title']);
        casescont.add(i['cases']);
        newcasecont.add(i['newcase']);
        deathcont.add(i['deaths']);
        newdeathcont.add(i['newdeath']);
        recovercont.add(i['recovered']);
      }
//       print(contries[3]);
//       print(contname);
      setState(() {
        print('helpline fetched');
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
        print('world data fetched');
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
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
      var data = response.body;
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
//      if(!isUpdateAvailable)
//        {
//          Alert(
//            context: context,
//            type: AlertType.warning,
//            title: "UPDATE Available",
//            desc: "Version: $latestversion\nDownload & install latest version of the app\nUpdates make your app better",
//            buttons: [
//              DialogButton(
//                child: Text(
//                  "UPDATE",
//                  style: TextStyle(color: Colors.white, fontSize: 20),
//                ),
//                onPressed:  _launchURL(updatelink),
//                color: Color(0xFF333366),
//              ),
//              DialogButton(
//                child: Text(
//                  "Cancel",
//                  style: TextStyle(color: Colors.white, fontSize: 20),
//                ),
//                onPressed: () => Navigator.pop(context),
//                color: Color(0xFF333366),
//              )
//            ],
//          ).show();
//        }
//      if(version< )
    // details > div > div > div > a
//      _showDialog();

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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("UPDATE Available"),
          content: new Text("Download & install latest version of the app\nUpdates make your app better"),
          actions: <Widget>[
            new FlatButton(onPressed: _launchURL(updatelink),
                child: new Text('Update',style: TextStyle(color: Colors.blueAccent,),)),
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
//  void setData(){
//    var inddata = indiaData;
//    tcaseind = int.parse(inddata['statewise'][0]['confirmed']);
//    actcaseind = int.parse(inddata['statewise'][0]['active']);
//    deathind = int.parse(inddata['statewise'][0]['deaths']);
//    recovind = int.parse(inddata['statewise'][0]['recovered']);
//    for(var i in inddata['statewise'])
//    {
//      states.add(i['state']);
//      stateData.add(i['confirmed']);
//      stateDeath.add(i['deaths']);
//      stateRecov.add(i['recovered']);
//    }
//    for(var i in inddata['cases_time_series'])
//    {
//      dates.add(i['date']);
//      datecases.add(i['dailyconfirmed']);
//      datetotcase.add(i['totalconfirmed']);
//    }
//
//    var worlddata = worldData;
//    tcasewld = int.parse(worlddata[0]['title'].toString().replaceAll(',', ''));
//    deathwld = int.parse(worlddata[1]['title'].toString().replaceAll(',', ''));
//    recovwld = int.parse(worlddata[2]['title'].toString().replaceAll(',', ''));
//    actcasewld = tcasewld-deathwld-recovwld;
//
//    var newsdata = newsData;
//    for (var i = 0; i < newsdata.length; i++) {
//      newslist.add(newsdata[i]['title']);
//      newslink.add(newsdata[i]['link']);
//    }
//
//  }
}