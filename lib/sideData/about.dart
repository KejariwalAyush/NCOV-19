import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NCOV-19',softWrap: true,),elevation: 15,
              centerTitle: true,backgroundColor: Colors.lightBlueAccent,
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:() => Navigator.pop(context,false)),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // IconButton(icon: Icon(Icons.picture_as_pdf),
            // onPressed:null),
            Center(
              child: Text('Hello, this app is made by \nAYUSH KEJARIWAL\n\nemail : ayush1kej@gmail.com\nI am currently studying in ITER,SOA University\nFind Source code of this app in Github\n\ngithub.com/KejariwalAyush/NCOV-19\n\n\nThe data has been taken from multiple sites:\nmohfw.gov.in\nhttps://covidout.in/\nhttps://ncov2019.live/\n\n\n\nThanks for using this app',textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),softWrap: true,),
              
            ),
          ],
        ),
        // backgroundColor: Colors.tealAccent,
        
    );
  }
}