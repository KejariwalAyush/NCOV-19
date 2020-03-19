import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
// import 'package:html/dom.dart';
import 'package:http/http.dart';

class newsPage extends StatefulWidget {
  @override
  _newsPageState createState() => _newsPageState();
}
  List state = List();
  List phone = List();
class _newsPageState extends State<newsPage> {
  // List state = List();
  // List phone = List();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NCOV-19 (NEWS)',softWrap: true,),elevation: 15,
              centerTitle: true,backgroundColor: Colors.lightBlueAccent,
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() => Navigator.pop(context,false)),

        ),
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
      SingleChildScrollView(child:Column(children: <Widget>[
        Card(child:Text('Helpline Numbers',textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),)),
        Divider(),
        // Container(child: Row(mainAxisSize:MainAxisSize.max ,crossAxisAlignment: CrossAxisAlignment.end, 
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        //   Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,mainAxisSize: MainAxisSize.min,
        //    children: <Widget>[
        //     for (var st in state) 
        //       Card(child:Text('$st',softWrap: true,),),
        //   ],),
        //   Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     mainAxisSize: MainAxisSize.max,children: <Widget>[
        //     for (var st in phone) 
        //       Card(child:Text('$st')),
        //   ],),
        // ],),),

        ],),
      ),

      
    );
  }

_fetchnews() async {
    setState(() {
      isLoading = true;
    });
    
    final Response response = await get("https://covidout.in/helpline");
    if (response.statusCode == 200) {
      var data = response.body;
      var document = parse(response.body);
      List links = document.querySelectorAll('tr');
      List<Map<String, dynamic>> linkMap = [];
      // print(linkMap);
      for (var link in links) {
        linkMap.add({
          'title': link.text,
          // 'contact': link.attributes['href'],
        });
      }      
      state = List();
      phone = List();
      var enc = json.encode(linkMap);
      List helpdata = jsonDecode(enc);
      // String x = helpdata[0]['title'];
      // print(x.split(new RegExp(r"[a-z]")));//[x.split(new RegExp(r"[a-z]")).length-1]);
     
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}