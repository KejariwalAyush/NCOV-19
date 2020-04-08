
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

class Frontpg extends StatelessWidget {
  static const String fontName = 'Comfortaa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 275.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                elevation: 20,
                actions: <Widget>[
                  FlatButton(child: Icon(Icons.refresh,color: Colors.white,size: 30,),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Splash()));}
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("NCOV - 19",
                        style: TextStyle(
                          fontFamily: fontName,
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    background: Image(image: AssetImage('assets/backround1.png',),
                      fit: BoxFit.cover,
                    ),
//                      "https://github.com/KejariwalAyush/NCOV-19/blob/master/assets/icon.png",
//                      fit: BoxFit.cover,
//                    )),
              ),
              ),
            ];
          },
          body: SingleChildScrollView(
           child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child:RichText(
                  text: TextSpan(
                      text: 'Tap/Press ',
                      style: TextStyle(fontFamily: fontName,
                          color: Colors.black54, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: 'on tabs to know more!',
                          style: TextStyle(
                              color: Colors.black38, fontSize: 16),
                        )
                      ]
                  ),
                ),
              ),
              InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => India()));
                 print('Tapped on India');
               },
               child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
                  height: 183,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[100]),
                  child: Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'INDIA',
                          style: TextStyle(fontFamily: fontName,
                              color: Colors.blue, fontSize: 28),
                          children: <TextSpan>[
                        TextSpan(text: ' Stats',
                            style: TextStyle(
                                color: Colors.black38, fontSize: 20),
                            )
                          ]
                        ),
                      ),
                      Divider(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 105.0,width: 105,
                            decoration: new BoxDecoration(
                              color: new Color(0xFF333366),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: new Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Cases',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                                Text('$tcaseind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                Text('${newtcaseind==0?'':'+$newtcaseind'}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          Container(
                            height: 105.0,width: 105,
                            decoration: new BoxDecoration(
                              color: new Color(0xFF333366),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: new Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Recovered',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                                Text('$recovind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                Text('${newrecovind==0?'':'+$newrecovind'}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),

                              ],
                            ),
                          ),
                          Container(
                            height: 105.0,width: 105,
                            decoration: new BoxDecoration(
                              color: new Color(0xFF333366),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: new Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Deaths',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                                Text('$deathind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                Text('${newdeathind==0?'':'+$newdeathind'}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
             ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WorldData()));
                  print('Tapped on World');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20),
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
                  height: 183,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[100]),
                  child: Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            text: 'World',
                            style: TextStyle(fontFamily: fontName,
                                color: Colors.blue, fontSize: 28),
                            children: <TextSpan>[
                              TextSpan(text: ' Stats',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 20),
                              )
                            ]
                        ),
                      ),
                      Divider(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 105.0,width: 105,
                            decoration: new BoxDecoration(
                              color: new Color(0xFF333366),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: new Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Cases',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                                Text('$tcasewld',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                Text('${newcasecont[1]==0?'':'${newcasecont[1]}'}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),

                              ],
                            ),
                          ),
                          Container(
                            height: 105.0,width: 105,
                            decoration: new BoxDecoration(
                              color: new Color(0xFF333366),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: new Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Recovered',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                                Text('$recovwld',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                Text('',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),

                              ],
                            ),
                          ),
                          Container(
                            height: 105.0,width: 105,
                            decoration: new BoxDecoration(
                              color: new Color(0xFF333366),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: new Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Deaths',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                                Text('$deathwld',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                                Text('${newdeathcont[1]==0?'':'${newdeathcont[1]}'}',style: TextStyle(fontSize: 15,color: Colors.red),textAlign: TextAlign.center,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsData()));
                  print('Tapped on News');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
//                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[100]),
                  child: RichText(
                    text: TextSpan(
                        text: 'CORONA',
                        style: TextStyle(fontFamily: fontName,
                            color: Colors.blue, fontSize: 28),
                        children: <TextSpan>[
                          TextSpan(text: ' NEWS',
                            style: TextStyle(
                                color: Colors.black38, fontSize: 20),
                          )
                        ]
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => helpPage()));
                  print('Tapped on HelpLine');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
//                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[100]),
                  child: RichText(
                    text: TextSpan(
                        text: 'HELPLINE',
                        style: TextStyle(fontFamily: fontName,
                            color: Colors.blue, fontSize: 28),
                        children: <TextSpan>[
                          TextSpan(text: ' Numbers',
                            style: TextStyle(
                                color: Colors.black38, fontSize: 20),
                          )
                        ]
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Symptoms()));
                  print('Tapped on Symptoms');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
//                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[100]),
                  child: Text('Symptoms',style: TextStyle(fontSize: 28,color: Colors.blue),textAlign: TextAlign.center,),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Preventions()));
                  print('Tapped on Precautions');
                },
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: double.maxFinite,
//                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[100]),
                  child: Text('Precautions',style: TextStyle(fontSize: 28,color: Colors.blue),textAlign: TextAlign.center,),
                ),
              ),
              Divider(),
              Center(
                child: RichText(
                  text: TextSpan(text: 'Update to latest version : ',
                      style: TextStyle(fontSize: 20,color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: 'update',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () { _launchURL("https://github.com/KejariwalAyush/NCOV-19/releases/latest");}
//                      ) // Not Working on click of url
                        )
                      ]
                  ),
                ),
              ),
              Divider(),
              Center(
                child: RichText(
                  text: TextSpan(text: 'Developed By : ',
                      style: TextStyle(fontSize: 20,color: Colors.black,),
                    children: <TextSpan>[
                      TextSpan(text: 'KejariwalAyush',
                          style: TextStyle(
                          color: Colors.blueAccent, fontSize: 20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () { _launchURL("https://github.com/KejariwalAyush");}
//                      ) // Not Working on click of url
                      )
                    ]
                  ),
                ),
              ),
              Divider(),
              Center(
                child: RichText(
                  text: TextSpan(text: 'Source Code : ',
                      style: TextStyle(fontSize: 20,color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: 'GitHub',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () { _launchURL("https://github.com/KejariwalAyush/NCOV-19");}
//                      ) // Not Working on click of url
                        )
                      ]
                  ),
                ),
              ),
              Divider(),
            ],
          )
          )
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
