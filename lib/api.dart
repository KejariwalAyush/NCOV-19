import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class CVapi {
// Map<String, String> headers = {"Content-Type": "application/json"};
  
  int totalCase ;
  // List<dynamic> data;
  String s;
  // CVapi(){initiate();}
  CVapi(){
    callweb();
  }
  
  callweb() async {
    Response resp = await get('https://covidout.in/');
    s = resp.body;
    int x = s.indexOf('window.__INITIAL_STATE__');
    s = s.substring(x+27,s.length-37);
    // this.data = jsonDecode(s);
    // this.totalCase = data.length;
    print('String Found');
  }
  List<dynamic> getData() {
    List<dynamic> data;
    if(s!=null){print('Found!!');
    data = jsonDecode(s);}
    else{
    callweb();getData();}
    totalCase = data.length;
    print(totalCase);
    return data;
  }
  
  
}