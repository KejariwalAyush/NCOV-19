import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart';

class CVapi {
// Map<String, String> headers = {"Content-Type": "application/json"};
  
  // CVapi(){initiate();}
  void main() =>initiate();

Future initiate() async {
  var client = Client();
  Response response = await client.get(
    'https://www.mohfw.gov.in/'
  );

  print(response.body);
}
  // callweb() async {
  //   http.Response resp = await http.get('https://www.mohfw.gov.in/');
  //   dom.Document document = parser.parse(resp.body);
  //   var dc = document.getElementsByTagName('Total number of confirmed COVID 2019 cases across India *	:');
  //   print(dc);
  // }

}