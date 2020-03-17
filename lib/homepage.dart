import 'package:flutter/material.dart';
import './api.dart';
import './sideData/about.dart';
import './sideData/symptoms.dart';
import './world.dart';

class MyHomePage extends StatelessWidget {
  // Color cardColor = Colors.lightBlueAccent[100];
  @override
  Widget build(BuildContext context) {
    // CVapi();
    return Scaffold(
      drawer: Drawer(child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text(
                'NCOV-19',
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
            Divider(),
            ListTile(
              leading: Icon(Icons.live_help),
              title: Text('Symptoms'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Symptoms())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.thumbs_up_down),
              title: Text('Preventions'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Symptoms())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('WORLD stats'),
              onTap: () =>Navigator.push(
                  context, MaterialPageRoute(builder: (context) => World())),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text('Settings'),
              onTap: null,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About())),
            ),
          ],
        ),
      ),
      ),
      appBar: AppBar(
        title: Text(
          'NCOV-19',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.max,
          // textBaseline: TextBaseline.ideographic,
          // GridView.count(
          //         primary: false,
          //         // padding: const EdgeInsets.all(20),
          //         crossAxisSpacing: 10,
          //         // mainAxisSpacing: 10,
          //         crossAxisCount: 1,
          children: <Widget>[
            Divider(),
            Card(
              // borderOnForeground: true,margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                'Tollfree No. - 1075',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              // borderOnForeground: true,margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                'The Helpline Number for corona-virus : +91-11-23978046',
                softWrap: true,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 5,
            ),
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Text(
                'Total no. of Corona Cases in India : \n137',
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
                'Total no. of Deaths in India : \n3',
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
                'Total number of Active COVID 2019 cases across India * : \n120',
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
                'Total number of Discharged/Cured COVID 2019 cases across India * : \n14',
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
