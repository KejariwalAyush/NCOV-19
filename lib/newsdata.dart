import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsData extends StatelessWidget {
  static const String fontName = 'Comfortaa';
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery
        .of(context)
        .orientation
        .index;
    return Scaffold(
      appBar: AppBar(
        title: Text("NCOV - 19",
            style: TextStyle(
              fontFamily: fontName,
              color: Colors.white,
              fontSize: 20.0,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
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
              Divider(height: 5,),
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
              Divider(height: 5,),
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
                        child: orientation == 0 ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(child: news['image']!=null?Image.network(news['image'],height: 170,):Icon(Icons.image,size: 100,),),
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
                        )
                            : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(child: Center(
                              child: news['image'] != null ? Image.network(
                                news['image'], height: 170,) : Icon(
                                Icons.image, size: 100,),)),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                    text: '${news['date']}',
                                    style: TextStyle(fontFamily: fontName,
                                        color: Colors.grey[400], fontSize: 15),
                                    children: <TextSpan>[
                                      TextSpan(text: '\n${news['title']}',
                                        style: TextStyle(
                                            color: Colors.teal[200],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(text: '\n${news['info']}',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 2,),
                    ],
                  ),
                ),
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
