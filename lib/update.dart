import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';


// ignore: camel_case_types
class update extends StatefulWidget {
  @override
  _updateState createState() => _updateState();
}
var isLoading = false;
// ignore: camel_case_types
class _updateState extends State<update> {
  var apklink;
  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      try {
        fetchupdate();
      } on Exception catch (e) {
        print(e);
      }

      print('Async done');
      // firstcall = false;
    });
    super.initState();
  }
  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SelectableText("Lorem ipsum..."),
      appBar: AppBar(
        title: Text(
          'NCOV-19 (HelpLine)',
          softWrap: true,
        ),
        elevation: 15,
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context, false)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: RaisedButton(color: Colors.blueGrey[200],
          child: new Text("Download latest apk",softWrap: true,textAlign: TextAlign.center,),
          onPressed: ()=>_launchURL('https://github.com'+apklink),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child:
          SelectableText ('Updates available at : ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 20),
          toolbarOptions: ToolbarOptions(
              copy: true,
              selectAll: true,
              cut: false,
              paste: false),)
          ),
          RaisedButton(child:Text("https://github.com/KejariwalAyush/NCOV-19/releases",softWrap: true,style: TextStyle(fontSize: 20),),color: Colors.lightBlue[100],
                          onPressed: ()=> _launchURL("https://github.com/KejariwalAyush/NCOV-19/releases")),
          // Divider(),Divider(),
          // RaisedButton(child:Text("Latest apk",softWrap: true,style: TextStyle(fontSize: 20),),color: Colors.lightBlue[100],
          //                 onPressed: ()=> _launchURL("https://github.com/KejariwalAyush/NCOV-19/releases")),
          
        ],
      ),
    );
  }

  fetchupdate() async {
    setState(() {
      isLoading = true;
    });
//    PackageInfo packageInfo = await PackageInfo.fromPlatform();
//  var version = packageInfo.version;
    // String version;
    final Response response = await get("https://github.com/KejariwalAyush/NCOV-19/releases/latest");
    if (response.statusCode == 200) {
//      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('div.d-flex.flex-justify-between.flex-items-center.py-1.py-md-2.Box-body.px-2 > a');
      // List updatetag = document.querySelectorAll('ul > li:nth-child(1) > a > span.css-truncate-target');
      List<Map<String, dynamic>> linkMap = [];
      // print(linkMap);
      for (var link in links) {
        linkMap.add({
          'title': link.text,
          'link': link.attributes['href'],
        });
      }    
      var enc = json.encode(linkMap);
      List updatedata = jsonDecode(enc);
      apklink = updatedata[0]['link'];
      print(apklink);
      // if((updatetag[0].text as double) > (version as double))print('Update available');
      // else if((updatetag[0].text as double) == (version as double))print('Up-to-date');
      // else print('you are a beta tester');
      // if(updatedata[0]['title'].toString().compareTo('other')!=0);
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
}