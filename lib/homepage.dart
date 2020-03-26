import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import './news.dart';
import './helpPage.dart';
import './frontPage.dart';
import './sideData/about.dart';
import './sideData/symptoms.dart';
import './sideData/preventions.dart';
import './update.dart';
import './world.dart';

class MyHomePage extends StatelessWidget {
  // Color cardColor = Colors.lightBlueAccent[100];
  @override
  Widget build(BuildContext context) {
    // DateTime dt = new DateTime(now.day, now.month,now.year, now.hour,now.minute);
    return DefaultTabController(
      length: 3, //no of slides

      child: Scaffold(
        drawer: widgetDrawer(context),
        appBar: AppBar(
          elevation: 5,
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
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.blue[800],
            dragStartBehavior: DragStartBehavior.start,
            indicatorWeight: 3,
            unselectedLabelColor: Colors.indigoAccent,
            tabs: [
              Tab(
                text: 'INDIA',
              ),
              Tab(
                text: 'WORLD',
              ),
              Tab(
                text: 'NEWS',
              ),
            ],
          ),
          // title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            FrontPage(),
            World(),
            newsPage(),
            // Icon(Icons.directions_car),
            // Icon(Icons.directions_transit),
            // Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
    // );
  }

  Widget widgetDrawer(context) {
    return Drawer(
      child: SingleChildScrollView(
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
            // BottomAppBar(child: Text('Developed by: Ayush Kejariwal'),),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_call),
              title: Text('HelpLine'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => helpPage())),
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
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Preventions())),
            ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.people),
            //   title: Text('News'),
            //   onTap: () =>Navigator.push(
            //       context, MaterialPageRoute(builder: (context) => newsPage())),
            // ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.system_update,
              ),
              title: Text('Update'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => update())),
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
    );
  }
}
