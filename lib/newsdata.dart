import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/splash.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';


class NewsData extends StatelessWidget {
  static const String fontName = 'Comfortaa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NCOV - 19",
            style: TextStyle(
              fontFamily: fontName,
              color: Colors.white,
              fontSize: 20.0,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        elevation: 20,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 20),
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
//            height: ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey[100]),
          child: Column(
            children: <Widget>[
              RichText(
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
              Divider(height: 10,),
              RichText(
                text: TextSpan(
                    text: 'Long Press ',
                    style: TextStyle(fontFamily: fontName,
                        color: Colors.black54, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: 'on tabs to read the article.',
                        style: TextStyle(
                            color: Colors.black38, fontSize: 16),
                      )
                    ]
                ),
              ),
              Divider(height: 20,),
//              newslist.length!=0?{
              for (var news in newsAllData)
              InkWell(
                onLongPress: ()=>_launchURL(news['link']),
                child:Column(
                  children: <Widget>[
                    Container(
    //                  height: 75.0,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
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
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(child: Image.network(news['image'],height: 170,),),
                          RichText(
                            text: TextSpan(
                                text: '${news['date']}',
                                style: TextStyle(fontFamily: fontName,
                                    color: Colors.grey[400], fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(text: '\n${news['title']}',
                                    style: TextStyle(
                                        color: Colors.teal[200], fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '\n${news['info']}',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 2,),
                ],
                ),
              ),//}:
//              Material(
//                borderRadius: BorderRadius.circular(10),
//                elevation: 9,
//                child: Container(
//                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//                  width: 300,
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.only(right: 16),
//                        width: 70,
//                        height: 70,
//                        decoration: BoxDecoration(color: Colors.grey.withOpacity(.6), ),
//                        child: Center(child: Icon(Icons.photo_size_select_actual, color: Colors.white, size: 38,),),
//                      ),
//                      Expanded(
//                        child: PlaceholderLines(
//                          count: 3,animate: true,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
              Center(
                child: Text('NEWS Source : https://indianexpress.com/',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
        ),
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
