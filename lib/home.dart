import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/helpPage.dart';
import 'package:flutter_app/india.dart';
import 'package:flutter_app/newsdata.dart';
import 'package:flutter_app/sideData/preventions.dart';
import 'package:flutter_app/sideData/symptoms.dart';
import 'package:flutter_app/splash.dart';
import 'package:flutter_app/worldstat.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data.dart';

class Frontpg extends StatefulWidget {
  static const String fontName = 'Comfortaa';

  @override
  _FrontpgState createState() => _FrontpgState();
}

class _FrontpgState extends State<Frontpg> {
  DateTime updateTime;
//  DateTime now = DateTime.now();

  var isLoading = false;

  Future<void> _fetch() async {
    setState(() {
      DataSource().fetchAll();

      var date = lastupdatetime.toString().split(' ')[0];
      var time = lastupdatetime.toString().split(' ')[1];
      updateTime = DateTime(
          int.parse(date.split('/')[2]),
          int.parse(date.split('/')[1]),
          int.parse(date.split('/')[0]),
          int.parse(time.split(':')[0]),
          int.parse(time.split(':')[1]),
          int.parse(time.split(':')[2]));
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
//      isLoading = true;
      _fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 230.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                elevation: 30,
                actions: <Widget>[
                  FlatButton(
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          // ignore: unnecessary_statements
                          RefreshIndicatorMode.refresh;
                          _fetch();
                        });
                      }),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("NCOV - 19",
                      style: TextStyle(
                        fontFamily: Frontpg.fontName,
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: RotatedBox(
                    quarterTurns: 0,
                    child: Image.asset(
                      'assets/back.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: RefreshIndicator(
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      //Alert(),
                      Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          child: tcaseind != 0 && tcasewld != 0
                              ? FadeAnimatedTextKit(
                              isRepeatingAnimation: true,
//                            duration: Duration(seconds: 3),
                              onTap: () {
                                print("Tap Event");
                              },
                              text: [
                                "Sanitize your hands Regularly!!!",
                                "Maintain Social Distancing",
                                "Tap on tabs to know more",
                                "Pull to REFRESH",
                              ],
                              textStyle: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                              alignment: AlignmentDirectional
                                  .center // or Alignment.topLeft
                          )
                              : RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'PULL to refresh!',
                                style: TextStyle(
                                    fontFamily: Frontpg.fontName,
                                    color: Colors.black54,
                                    fontSize: 20),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                    '\nSince data didn\'t load properly',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 18),
                                  ),
                                ]),
                          )),
                      Center(
                        child: Text(
                          'Last India data Updated on: ${updateTime != null
                              ? DateTime
                              .now()
                              .difference(updateTime)
                              .inMinutes > 60 ? '${DateTime
                              .now()
                              .difference(updateTime)
                              .inHours} hours ago' : DateTime
                              .now()
                              .difference(updateTime)
                              .inMinutes <= 0 ? '${DateTime
                              .now()
                              .difference(updateTime)
                              .inSeconds} seconds ago' : '${DateTime
                              .now()
                              .difference(updateTime)
                              .inMinutes} minutes ago'
                              : null}',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => India()));
                          print('Tapped on India');
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 10),
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: double.maxFinite,
//                          height: 175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[100]),
                          child: Column(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    text: 'INDIA',
                                    style: TextStyle(
                                        fontFamily: Frontpg.fontName,
                                        color: Colors.blue,
                                        fontSize: 28),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Stats',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 20),
                                      )
                                    ]),
                              ),
//                              Divider(
//                                height: 10,
//                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
//                                    height: 105.0,
//                                    width: 105,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
                                      decoration: new BoxDecoration(
                                        color: new Color(0xFF333366),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        new BorderRadius.circular(8.0),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                            offset: new Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Cases',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white60),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '$tcaseind',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
//                                        if(newtcaseind!=0)
                                          Text(
                                            '${newtcaseind == 0
                                                ? 'N/A'
                                                : '+$newtcaseind'}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
//                                    height: 105.0,
//                                    width: 105,
                                      decoration: new BoxDecoration(
                                        color: new Color(0xFF333366),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        new BorderRadius.circular(8.0),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                            offset: new Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Recov.',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white60),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '$recovind',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
//                                        if(newtcaseind!=0)
                                          Text(
                                            '${newrecovind == 0
                                                ? 'N/A'
                                                : '+$newrecovind'}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
//                                    height: 105.0,
//                                    width: 105,
                                      decoration: new BoxDecoration(
                                        color: new Color(0xFF333366),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        new BorderRadius.circular(8.0),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                            offset: new Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Deaths',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white60),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '$deathind',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
//                                        if(newtcaseind!=0)
                                          Text(
                                            '${newdeathind == 0
                                                ? 'N/A'
                                                : '+$newdeathind'}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 7,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => WorldData()));
                          print('Tapped on World');
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 10),
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: double.maxFinite,
//                          height: 175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[100]),
                          child: Column(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    text: 'World',
                                    style: TextStyle(
                                        fontFamily: Frontpg.fontName,
                                        color: Colors.blue,
                                        fontSize: 28),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Stats',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 20),
                                      )
                                    ]),
                              ),
//                              Divider(
//                                height: 10,
//                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
//                                    height: 105.0,
//                                    width: 105,
                                      decoration: new BoxDecoration(
                                        color: new Color(0xFF333366),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        new BorderRadius.circular(8.0),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                            offset: new Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Cases',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white60),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '$tcasewld',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
//                                        if(newcasecont[8]!=0)
//                                        Text('${newcasecont[8]==0?'N/A':'${newcasecont[8]}'}',
//                                          style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
//                                    height: 105.0,
//                                    width: 105,
                                      decoration: new BoxDecoration(
                                        color: new Color(0xFF333366),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        new BorderRadius.circular(8.0),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                            offset: new Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Recov.',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white60),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '$recovwld',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
//                                        if(newcasecont[8]!=0)
//                                        Text('${newrecovwld==0?'N/A':'$newrecovwld'}',
//                                          style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),
//                                        Text('${newdeathcont[8]}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
//                                    height: 105.0,
//                                    width: 105,
                                      decoration: new BoxDecoration(
                                        color: new Color(0xFF333366),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                        new BorderRadius.circular(8.0),
                                        boxShadow: <BoxShadow>[
                                          new BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10.0,
                                            offset: new Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            'Deaths',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white60),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '$deathwld',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
//                                        if(newcasecont[8]!=0)
//                                        Text('${newdeathcont[8]==0?'N/A':'${newdeathcont[8]}'}',
//                                          style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),
//                                        Text('${newdeathcont[8]==0?'':'${newdeathcont[8]}'}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 7,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => NewsData()));
                          print('Tapped on News');
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              width: double.maxFinite,
//                  height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blueGrey[100]),
                              child: Column(
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                        text: 'NEWS',
                                        style: TextStyle(
                                            fontFamily: Frontpg.fontName,
                                            color: Colors.blue,
                                            fontSize: 28),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' Headlines',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                            text: '\nTap to know more!',
                                            style: TextStyle(
                                                color: Colors.black38,
                                                fontSize: 14),
                                          ),
                                        ]),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 10),
                                    margin: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    width: double.maxFinite,
//                          height: 175,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blueGrey[100]),
                                    child: Column(
                                      children: <Widget>[
                                        for (int i = 0; i < 5; i++)
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                          RichText(
                                            text: TextSpan(
                                                text: '${i + 1}. ',
                                                style: TextStyle(
                                                    fontFamily:
                                                    Frontpg.fontName,
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                    '${newsAllData[i]['title']}.',
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ]),
                                            textAlign: TextAlign.justify,
                                          ),
                                              Divider(
                                                height: 5,
                                          ),
                                            ],
                                          ),
                                  ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => helpPage()));
                          print('Tapped on HelpLine');
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: double.maxFinite,
//                  height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[100]),
                          child: RichText(
                            text: TextSpan(
                                text: 'HELPLINE',
                                style: TextStyle(
                                    fontFamily: Frontpg.fontName,
                                    color: Colors.blue,
                                    fontSize: 28),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Numbers',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 20),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => Symptoms()));
                          print('Tapped on Symptoms');
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: double.maxFinite,
//                  height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[100]),
                          child: Text(
                            'Symptoms',
                            style: TextStyle(fontSize: 28, color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Preventions()));
                          print('Tapped on Precautions');
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: double.maxFinite,
//                  height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueGrey[100]),
                          child: Text(
                            'Precautions',
                            style: TextStyle(fontSize: 28, color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Update to latest version : ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'update',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            "https://github.com/KejariwalAyush/NCOV-19/releases/latest");
                                      }
//                      ) // Not Working on click of url
                                )
                              ]),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Developed By : ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'KejariwalAyush',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            "https://github.com/KejariwalAyush");
                                      }
//                      ) // Not Working on click of url
                                )
                              ]),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Source Code : ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'GitHub',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            "https://github.com/KejariwalAyush/NCOV-19");
                                      }
//                      ) // Not Working on click of url
                                )
                              ]),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Version ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '$version',
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchURL(
                                            "https://github.com/KejariwalAyush/NCOV-19");
                                      }
//                      ) // Not Working on click of url
                                )
                              ]),
                        ),
                      ),
                      Divider(),
                    ],
                  )),
              onRefresh: _fetch)
//              : Center(child: RefreshProgressIndicator(),),
      ),
    );
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
}
