import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class Symptoms extends StatelessWidget {
  static const String fontName = 'Comfortaa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NCOV - 19",
              style: TextStyle(
                fontFamily: fontName,
                color: Colors.white,
                fontSize: 20.0,
              )),
          centerTitle: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 20,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
//            height: ,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey[100]),
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: 'Symptoms',
                      style: TextStyle(fontFamily: fontName,
                          color: Colors.blue, fontSize: 28),
                  ),
                ),
                Divider(height: 10,),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Divider(),
                      Center(child: Text('Body Diagram',style: TextStyle(fontSize: 20),),),
//                                Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/COVID-19_Outbreak_World_Map_per_Capita.svg/1920px-COVID-19_Outbreak_World_Map_per_Capita.svg.png',
//                                  width: double.maxFinite,fit: BoxFit.fitWidth,
//                                ),
                      Card(color: Colors.blueGrey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PhotoView(
                            enableRotation: false,basePosition: Alignment.center,tightMode: true,//minScale: 10,
                            imageProvider: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Symptoms_of_coronavirus_disease_2019_4.0.svg/1920px-Symptoms_of_coronavirus_disease_2019_4.0.svg.png',),
                            backgroundDecoration: BoxDecoration(color: Colors.blueGrey[100]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            Card(margin: EdgeInsets.all(10),
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Text('Symptoms of COVID-19 are non-specific and those infected may either be asymptomatic or develop flu like symptoms such as fever, cough, fatigue, shortness of breath, or muscle pain.\nThe typical signs and symptoms and their prevalence, are shown in the corresponding table.Further development can lead to severe pneumonia, acute respiratory distress syndrome, sepsis, septic shock and death.\n\nSome of those infected may be asymptomatic, returning test results that confirm infection but show no clinical symptoms, so researchers have issued advice that those with close contact to confirmed infected people should be closely monitored and examined to rule out infection.The usual incubation period (the time between infection and symptom onset) ranges from one to fourteen days; it is most commonly five days.\n\nIn one case, it had an incubation period of 27 days',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),softWrap: true,),)
                ),
                Divider(),
                Text('% wise Symptoms',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.blue),),
                Card(margin: EdgeInsets.all(10),
                  child:Padding(padding: EdgeInsets.all(10),
                    child:Text('Symptoms\t\t\t\t\t\t\t\t\t\t\t\t\t	%\nFever\t\t\t\t\t\t\t\t\t\t\t\t\t	87.9%\nDry cough\t\t\t\t\t\t\t\t\t\t\t\t\t	67.7%\nFatigue\t\t\t\t\t\t\t\t\t\t\t\t\t	38.1%\nSputum production\t\t\t\t\t\t\t\t\t\t\t\t\t	33.4%\nShortness of breath\t\t\t\t\t\t\t\t\t\t\t\t\t	18.6%\nMuscle pain or joint pain	\t\t\t\t\t\t\t\t\t\t\t\t\t14.8%\nSore throat\t\t\t\t\t\t\t\t\t\t\t\t\t	13.9%\nHeadache\t\t\t\t\t\t\t\t\t\t\t\t\t	13.6%\nChills\t\t\t\t\t\t\t\t\t\t\t\t\t	11.4%\nNausea or vomiting\t\t\t\t\t\t\t\t\t\t\t\t\t	5.0%\nNasal congestion\t\t\t\t\t\t\t\t\t\t\t\t\t	4.8%\nDiarrhoea\t\t\t\t\t\t\t\t\t\t\t\t\t	3.7%\nHaemoptysis\t\t\t\t\t\t\t\t\t\t\t\t\t	0.9%\nConjunctival congestion\t\t\t\t\t\t\t\t\t\t\t\t\t	0.8%',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    textAlign: TextAlign.end,textWidthBasis: TextWidthBasis.parent,),),
                ),
              ],
            ),
          ),
        ),
//        body:SingleChildScrollView(
//              child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            Card(child:Text('SYMPTOMS',softWrap: true,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
//            Card(
//              child: Text('Symptoms of COVID-19 are non-specific and those infected may either be asymptomatic or develop flu like symptoms such as fever, cough, fatigue, shortness of breath, or muscle pain.\nThe typical signs and symptoms and their prevalence, are shown in the corresponding table.Further development can lead to severe pneumonia, acute respiratory distress syndrome, sepsis, septic shock and death.\n\nSome of those infected may be asymptomatic, returning test results that confirm infection but show no clinical symptoms, so researchers have issued advice that those with close contact to confirmed infected people should be closely monitored and examined to rule out infection.The usual incubation period (the time between infection and symptom onset) ranges from one to fourteen days; it is most commonly five days.\n\nIn one case, it had an incubation period of 27 days',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(fontSize: 20),softWrap: true,),
//            ),
//            Divider(),
//            Text('% wise Symptoms',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.blue),),
//            Card(child:
//                Text('Symptoms\t\t\t\t\t\t\t\t\t\t\t\t\t	%\nFever\t\t\t\t\t\t\t\t\t\t\t\t\t	87.9%\nDry cough\t\t\t\t\t\t\t\t\t\t\t\t\t	67.7%\nFatigue\t\t\t\t\t\t\t\t\t\t\t\t\t	38.1%\nSputum production\t\t\t\t\t\t\t\t\t\t\t\t\t	33.4%\nShortness of breath\t\t\t\t\t\t\t\t\t\t\t\t\t	18.6%\nMuscle pain or joint pain	\t\t\t\t\t\t\t\t\t\t\t\t\t14.8%\nSore throat\t\t\t\t\t\t\t\t\t\t\t\t\t	13.9%\nHeadache\t\t\t\t\t\t\t\t\t\t\t\t\t	13.6%\nChills\t\t\t\t\t\t\t\t\t\t\t\t\t	11.4%\nNausea or vomiting\t\t\t\t\t\t\t\t\t\t\t\t\t	5.0%\nNasal congestion\t\t\t\t\t\t\t\t\t\t\t\t\t	4.8%\nDiarrhoea\t\t\t\t\t\t\t\t\t\t\t\t\t	3.7%\nHaemoptysis\t\t\t\t\t\t\t\t\t\t\t\t\t	0.9%\nConjunctival congestion\t\t\t\t\t\t\t\t\t\t\t\t\t	0.8%',
//                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                textAlign: TextAlign.end,textWidthBasis: TextWidthBasis.parent,),
//            ),
//          ]
//      )
//    )
        
    );
  }
}