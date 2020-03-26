import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
// import 'package:html/dom.dart';
import 'package:http/http.dart';

class helpPage extends StatefulWidget {
  @override
  _helpPageState createState() => _helpPageState();
}

List state = List();
List phone = List();
bool firstcall = true;

class _helpPageState extends State<helpPage> {
  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      fetchhelpline();
      print('Async done');
      firstcall = false;
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
  // _helpPageState(){_fetchhelpline;}
  @override
  Widget build(BuildContext context) {
    // var initial = _fetchhelpline;
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
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(0.0),
      //   child: RaisedButton(
      //     color: Colors.blueGrey[200],
      //     child: new Text(
      //       "REFRESH",
      //       softWrap: true,
      //       textAlign: TextAlign.center,
      //     ),
      //     onPressed: fetchhelpline,
      //   ),
      // ),
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    strokeWidth: 10,
                  ),
                  Divider(),
                  Text(
                    "Loading...\nUntil then sanitize your hands",
                    softWrap: true,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Card(
                      child: Text(
                    'Helpline Numbers',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  )),
                  Card(
                      child: Text(
                    'press & hold to copy phone no.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Divider(),
                  Container(
                        width: double.maxFinite,
                        // height: 215,
                        color: Colors.white,
                        padding: EdgeInsets.all(2.0),
                        child: SingleChildScrollView(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                            for (var i = 0; i < state.length; i++)                                 
                             TableRow(children: [
                               Text(
                                    state[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                SelectableText(
                                    phone[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    toolbarOptions: ToolbarOptions(
                                        copy: true,
                                        selectAll: true,
                                        cut: false,
                                        paste: false),
                                  ),
                             ]),
                            ],),
                        ),
                    )
                  // Container(child: Row(mainAxisSize:MainAxisSize.max ,crossAxisAlignment: CrossAxisAlignment.end,
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment
                  //       .spaceBetween, //mainAxisSize: MainAxisSize.min,
                  //   children: <Widget>[
                  //     for (var st = 0; st < state.length; st++)
                  //       Card(
                  //         child: SelectableText(
                  //           state[st] + '     :     ' + phone[st],
                  //           textAlign: TextAlign.justify,
                  //           toolbarOptions: ToolbarOptions(
                  //               copy: true,
                  //               selectAll: true,
                  //               cut: false,
                  //               paste: false),
                  //           style: Theme.of(context).textTheme.title,
                  //         ),
                  //       ),
                  //   ],
                  // ),
                  // Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   mainAxisSize: MainAxisSize.max,children: <Widget>[
                  //   for (var st in phone)
                  //     Card(child:Text('$st')),
                  // ],),
                  // ],),
                  // ),
                ],
              ),
            ),
    );
  }

  fetchhelpline() async {
    setState(() {
      isLoading = true;
    });

    state = List();phone = List();
    final Response response = await get("https://api.rootnet.in/covid19-in/contacts");
    if (response.statusCode == 200) {
      var list = json.decode(response.body) ;
      print(list['data']);
      
      for (var stats in list['data']['contacts']['regional']) {
        state.add(stats['loc']);//+' : '+stats['']);
        phone.add(stats['number']);
        // stateDeath.add(stats['deaths']);
      }
      // var data = response.body;
      // var document = parse(response.body);
      // List links = document.querySelectorAll('tr');
      // List<Map<String, dynamic>> linkMap = [];
      // // print(linkMap);
      // for (var link in links) {
      //   linkMap.add({
      //     'title': link.text,
      //     // 'contact': link.attributes['href'],
      //   });
      // }
      // state = List();
      // phone = List();
      // var enc = json.encode(linkMap);
      // List helpdata = jsonDecode(enc);
      // // String x = helpdata[0]['title'];
      // // print(x.split(new RegExp(r"[a-z]")));//[x.split(new RegExp(r"[a-z]")).length-1]);
      // for (var i = 1; i < helpdata.length; i++) {
      //   String x = helpdata[i]['title'];
      //   var name = x.split(new RegExp(r"[0-9]"));
      //   var ph = x.split(new RegExp(r"[a-z]"));
      //   if (i != 29) {
      //     if (name[1] != null) if (name[1].length <= 2) {
      //       if (name[2].length > 21) {
      //         state.add(
      //             name[2].substring(0, 20)); //+'\n'+name[2].substring(20));
      //       } else
      //         state.add(name[2]);
      //     } else if (name[1].length > 21) {
      //       state.add(name[1].substring(0, 20)); //+'\n'+name[1].substring(20));
      //     } else
      //       state.add(name[1]);
      //     phone.add(ph[ph.length - 1]);
      //   }
      // }
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load');
    }
  }
}
