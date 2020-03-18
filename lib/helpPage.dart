import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
// import 'package:html/dom.dart';
import 'package:http/http.dart';

class helpPage extends StatefulWidget {
  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  List state = List();
  List phone = List();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NCOV-19',softWrap: true,),elevation: 15,
              centerTitle: true,backgroundColor: Colors.lightBlueAccent,
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() => Navigator.pop(context,false)),

        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: RaisedButton(color: Colors.blueGrey[200],
          child: new Text("REFRESH\nUpdated on :  ",softWrap: true,textAlign: TextAlign.center,),
          onPressed: _fetchhelpline,
        ),

      ),

      // ),
      body: isLoading ? Center(
        // child: CircularProgressIndicator(strokeWidth: 10,)
        ):
      Container(),

      
    );
  }

_fetchhelpline() async {
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
      for (var i = 0; i < helpdata.length; i++) {  
        String x =helpdata[i]['title'];
        var name =  x.split(new RegExp(r"[0-9]"));
        if(name.length != 1 && name[1] != null )//&& name[2] == null)
          state.add(name[1]);
        else if(name.length != 1 && name[2] != null)// && name[1]==null)
          state.add(name[2]);
        var ph = x.split(new RegExp(r"[a-z]"));
        if(ph[ph.length-1] != null)
          phone.add(ph[ph.length-1]);
      } 
      for (var item in phone) {
      print(item);
      }
      print(state.length);
      print(phone.length);
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}