import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
// import 'package:html/dom.dart';
import 'package:http/http.dart';

class newsPage extends StatefulWidget {
  @override
  _newsPageState createState() => _newsPageState();
}
  // List state = List();
  List newslist = List();
class _newsPageState extends State<newsPage> {
  // List state = List();
  // List phone = List();
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
          onPressed: _fetchnews,
        ),
      ),
      body: isLoading ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
        CircularProgressIndicator(strokeWidth: 10,),Divider(),
        Text("Loading...\nUntill then sanitize your hands",softWrap: true,textAlign: TextAlign.center,)
      ],),):
      SingleChildScrollView(child:Column(children: <Widget>[//Divider(),
        Card(child:Text('NEWS HEADLINES',textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),)),
        // Divider(),
        Divider(thickness: 5,color: Colors.black,),
        Container(child: //Row(mainAxisSize:MainAxisSize.max ,crossAxisAlignment: CrossAxisAlignment.end, 
        //      // mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,mainAxisSize: MainAxisSize.min,
           children: <Widget>[
            for (var st in newslist)
              Card(child:Text('#  $st',softWrap: true,style: TextStyle(fontSize: 20),),),
            Divider(thickness: 5,color: Colors.black,),
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

_fetchnews() async {
    setState(() {
      isLoading = true;
    });
    
    final Response response = await get("https://indianexpress.com/about/coronavirus/");
    if (response.statusCode == 200) {
      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('ul > li > a');
      List<Map<String, dynamic>> linkMap = [];
      // print(linkMap);
      for (var link in links) {
        linkMap.add({
          'title': link.text,
          // 'contact': link.attributes['href'],
        });
      }      
      // state = List();
      newslist = List();
      var enc = json.encode(linkMap);
      List newsdata = jsonDecode(enc);
      // print(x.split(new RegExp(r"[a-z]")));//[x.split(new RegExp(r"[a-z]")).length-1]);
      String x = newsdata[21]['title'];
      print(x);int i=22;
      while(i<30) {
        newslist.add(x);
        x=newsdata[i]['title'];
        i++;//print(x);
      }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}