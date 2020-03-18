import 'package:flutter/material.dart';

import './frontPage.dart';
import './details.dart';
import './api.dart';
import './sideData/about.dart';
import './sideData/symptoms.dart';
import './world.dart';

class MyHomePage extends StatelessWidget {
  // Color cardColor = Colors.lightBlueAccent[100];
  @override
  Widget build(BuildContext context) {
    
    // DateTime dt = new DateTime(now.day, now.month,now.year, now.hour,now.minute);
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
      body: FrontPage(),
      // bottomNavigationBar: BottomAppBar(
      //   child: Text(
      //     'Updated on : $now ',
      //     softWrap: true,
      //     style: TextStyle(fontSize: 16),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
    );
  }
}
