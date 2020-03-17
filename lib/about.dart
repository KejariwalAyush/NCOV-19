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
              child: Text('Hello, this app is made by \nAYUSH KEJARIWAL\n\nThis is just a scrap of Official website "mohfw.gov.in"',textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),softWrap: true,),
              
            ),
          ],
        ),
        // backgroundColor: Colors.tealAccent,
        
    );
  }
}