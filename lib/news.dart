import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
// import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class newsPage extends StatefulWidget {
  @override
  _newsPageState createState() => _newsPageState();
}
  List newslink = List();
  List newslist = List();
bool firstcall = true;
class _newsPageState extends State<newsPage> {
    @override
  void initState() {
    _getThingsOnStartup().then((value){fetchnews();
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
    return Scaffold(
      // appBar: AppBar(title: Text('NCOV-19 (NEWS)',softWrap: true,),elevation: 15,
      //         centerTitle: true,backgroundColor: Colors.lightBlueAccent,
      //         automaticallyImplyLeading: true,
      //         leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() => Navigator.pop(context,false)),

      //   ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: RaisedButton(color: Colors.blueGrey[200],
          child: new Text("REFRESH",softWrap: true,textAlign: TextAlign.center,),
          onPressed: fetchnews,
        ),
      ),
      body: isLoading ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
        CircularProgressIndicator(strokeWidth: 10,),Divider(),
        Text("Loading...\nUntil then sanitize your hands",softWrap: true,textAlign: TextAlign.center,)
      ],),):
      SingleChildScrollView(child:Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
        Card(child:Text('NEWS HEADLINES',textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),)),
        Card(child:Text('Long Press on headline to read the article',textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        // Divider(),
        Divider(thickness: 5,color: Colors.black,),
        Container(child: //Row(mainAxisSize:MainAxisSize.max ,crossAxisAlignment: CrossAxisAlignment.end, 
        //      // mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,mainAxisSize: MainAxisSize.min,
           children: <Widget>[
            for (var st =0;st< newslist.length;st++)
              RaisedButton(child:Text('#  \n'+newslist[st],softWrap: true,style: TextStyle(fontSize: 20),),onPressed: null,color: Colors.lightBlue[100],
                          onLongPress: ()=> _launchURL(newslink[st])),
            Divider(thickness: 5,color: Colors.black,),
            Card(child:Text('NEWS Source : https://indianexpress.com/',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),)),
          ],),
        //   Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     mainAxisSize: MainAxisSize.max,children: <Widget>[
        //     for (var st in phone) 
        //       Card(child:Text('$st')),
        //   ],),
        // ],),),

      ),],),
      ),

      
    );
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