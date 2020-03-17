
import 'package:flutter/material.dart';

class World extends StatelessWidget {
  // Color cardColor = Colors.lightBlueAccent[100];
  @override
  Widget build(BuildContext context) {
    // CVapi();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NCOV-19 (World Stats)',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context,false),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Divider(),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Text(
                'Total no. of Corona Cases : \n188,297',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.redAccent[200],
              child: Text(
                'Total no. of Deaths : \n7499',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.redAccent[100],
              child: Text(
                'Total number of Active COVID 2019 cases : \n99,950',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.greenAccent[200],
              child: Text(
                'Total number of Discharged/Cured COVID 2019 cases : \n80,848',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text(
          'Updated on : 17.03.2020 at 05:15 PM ',
          softWrap: true,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
