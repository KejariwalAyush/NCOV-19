import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';

class India extends StatefulWidget {
  static const String fontName = 'Comfortaa';

  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  String dropdownvalue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NCOV - 19",
            style: TextStyle(
              fontFamily: India.fontName,
              color: Colors.white,
              fontSize: 20.0,
            )),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        elevation: 20,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.redAccent,
      ),
      body:SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Column(
         children: <Widget>[
          Container(
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
                      text: 'INDIA',
                      style: TextStyle(fontFamily: India.fontName,
                          color: Colors.blue, fontSize: 28),
                      children: <TextSpan>[
                        TextSpan(text: ' Stats',
                          style: TextStyle(
                              color: Colors.black38, fontSize: 20),
                        ),
//                        TextSpan(text: '\nLast Updated on: ${indAllData[0]['overall']['lastupdatedtime']}',
//                          style: TextStyle(
//                              color: Colors.black38, fontSize: 20),
//                        )
                      ]
                  ),
                ),
                Divider(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 75.0,
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        color: new Color(0xFF333366),
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(10.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Cases',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          RichText(text:TextSpan(text:'$tcaseind',style: TextStyle(fontSize: 20,color: Colors.white),
                            children: <TextSpan>[TextSpan(text:'${newtcaseind==0?'':' +$newtcaseind'}',style: TextStyle(fontSize: 15,color: Colors.red),),],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 10,),
                    Container(
                      height: 75.0,
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        color: new Color(0xFF333366),
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(10.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Active Cases',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          Text('$actcaseind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                    Divider(height: 10,),
                    Container(
                      height: 75.0,
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        color: new Color(0xFF333366),
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(10.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Recovered',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          RichText(text:TextSpan(text:'$recovind',style: TextStyle(fontSize: 20,color: Colors.white),
                            children: <TextSpan>[TextSpan(text:'${newrecovind==0?'':' +$newrecovind'}',style: TextStyle(fontSize: 15,color: Colors.red),),],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 10,),
                    Container(
                      height: 75.0,
                      width: double.maxFinite,
                      decoration: new BoxDecoration(
                        color: new Color(0xFF333366),
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(10.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Deaths',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          RichText(text:TextSpan(text:'$deathind',style: TextStyle(fontSize: 20,color: Colors.white),
                            children: <TextSpan>[TextSpan(text:'${newdeathind==0?'':' +$newdeathind'}',style: TextStyle(fontSize: 15,color: Colors.red),),],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(height: 10,),
                PieChart(),
                Divider(height: 10,),
                Center(child: Text('State-wise Data',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.all(5),
                  width: double.maxFinite,
                  height: 250,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[300]),
                  child: SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
                      child:DataTable(
                        columnSpacing: 1,
                        dataRowHeight: 30,
                        headingRowHeight: 50,
                        horizontalMargin: 10,
//                        sortColumnIndex: 1,
//                        sortAscending: true,
                        columns: [
                          DataColumn(label: Text('States'),),
                          DataColumn(label: Text('Cases'),numeric: true,),
//                            onSort: (columnIndex, ascending) {
////                            setState(() {
////                            sort = !sort;
////                            });
//                            onSort(columnIndex);}),
                          DataColumn(label: Text('Deaths'),numeric: true),
                          DataColumn(label: Text('Recovered'),numeric: true,),
                        ],
                        rows: [
                          for(int i=1;i<states.length;i++)
                            DataRow(
                                cells:[
                              DataCell(
                                 RichText(
                                    text: TextSpan(
                                      text: '${states[i]}',
                                      style: TextStyle(fontFamily: India.fontName,
                                          color: Colors.deepPurple),
                                    ),
                                ),
                              ),
                              DataCell(RichText(
                                text: TextSpan(
                                    text: '${stateData[i]}',
                                    style: TextStyle(fontFamily: India.fontName,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(text: '${newstateData[i]=='0'?'':'\n+${newstateData[i]}'}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    ]
                                ),
                              ),),
                              DataCell(RichText(
                                text: TextSpan(
                                    text: '${stateDeath[i]}',
                                    style: TextStyle(fontFamily: India.fontName,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(text: '${newstateDeath[i]=='0'?'':'\n+${newstateDeath[i]}'}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    ]
                                ),
                              ),),
                              DataCell(RichText(
                                text: TextSpan(
                                  text: '${stateRecov[i]}',
                                  style: TextStyle(fontFamily: India.fontName,
                                      color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(text: '${newstateRecov[i]=='0'?' ':'\n+${newstateRecov[i]}'}',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      )
                                    ]
                                ),
                              ),
                              ),
                            ],
//                              onSelectChanged: DataTable(rows: <DataRow>[], columns: <DataColumn>[],),
                            ),
                        ],
                      ),
                  ),
                ),
                Divider(height: 10,),
                Center(child: Text('District-wise Data',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                District(),
                Divider(height: 10,),
                BarChart(),
              ],
            ),
          )
        ],
      ),)
    );
  }
}
class GradesData {
  final String gradeSymbol;
  final int number;
  final charts.Color col;

  GradesData(this.gradeSymbol, this.number,this.col);
}
class PopulationData {
  String year;
  int population;
  PopulationData(
    this.year,
    this.population,
  );
}

class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}
class _DistrictState extends State<District> {
  String dropdownvalue = distdata[0]['state'];
  int stcount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.all(5),
        width: double.maxFinite,
        height: 230,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Column(children: <Widget>[
            DropdownButton<String>(
              value: dropdownvalue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownvalue = newValue;
//                  stcount = 3;
                  for(int i=0;i<distdata.length;i++)
                  if(distdata[i]['state'].compareTo(dropdownvalue.toString())==0){
                    stcount = i;break;
                  }
                });
              },
              items: <String>[for(var st=0;st< distdata.length;st++)
    //            if(stateData[st]==0)
                  distdata[st]['state'],]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
            DataTable(
              columnSpacing: 1,
              dataRowHeight: 30,
              headingRowHeight: 50,
              horizontalMargin: 10,
//                        sortColumnIndex: 1,
//                        sortAscending: true,
              columns: [
                DataColumn(label: Text('Districts'),),
                DataColumn(label: Text('Cases'),numeric: true,),
              ],
              rows: [
                for(var i in distdata[stcount]['districtData'])
                  DataRow(
                    cells:[
                      DataCell(
                        RichText(
                          text: TextSpan(
                            text: '${i['district']}',
                            style: TextStyle(fontFamily: India.fontName,
                                color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      DataCell(RichText(
                        text: TextSpan(
                            text: '${i['confirmed']}',
                            style: TextStyle(fontFamily: India.fontName,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: '${i['delta']['confirmed']=='0'?'':' +${i['delta']['confirmed']}'}',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 12),
                              )
                            ]
                        ),
                      ),),

                    ],
//                              onSelectChanged: DataTable(rows: <DataRow>[], columns: <DataColumn>[],),
                  ),
              ],
            ),
          
          ],
        ),
        ),
    );
  }
}


class PieChart extends StatelessWidget {


  final data = [
    GradesData('Active', actcaseind,charts.ColorUtil.fromDartColor(Colors.redAccent)),
    GradesData('Recovered', recovind,charts.ColorUtil.fromDartColor(Colors.lightGreen)),
    GradesData('Deaths', deathind,charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  ];

  _getSeriesData() {
    List<charts.Series<GradesData, String>> series = [
      charts.Series(
          id: "Grades",
          data: data,
          labelAccessorFn: (GradesData row, _) => '${row.gradeSymbol}:${row.number}',
          domainFn: (GradesData grades, _) => grades.gradeSymbol,
          measureFn: (GradesData grades, _) => grades.number,
          colorFn: (GradesData series, _) => series.col,
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey[300]),
          height: 350,
          padding: EdgeInsets.all(10),
          child: Card(color: Colors.blueGrey[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Total data represented in PIE Chart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
                  Expanded(
                    child: new charts.PieChart(
                      _getSeriesData(),
                      animate: true,
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 150,startAngle: 40,
                          arcRendererDecorators: [new charts.ArcLabelDecorator()]
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}

class BarChart extends StatelessWidget {
  final data = [
    for(int i=0;i<dates.length;i++)
      new PopulationData(dates[i].toString(),int.parse(datecases[i])),
  ];
  _getSeriesData() {
    List<charts.Series<PopulationData, String>> series = [
      charts.Series(
          id: "Population",
          data: data,overlaySeries: true,
          domainFn: (PopulationData series, _) => series.year.toString(),//.split(' ')[1],
//          domainFormatterFn: ,
          measureFn: (PopulationData series, _) => series.population,
      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[300]),
        height: 250,
        padding: EdgeInsets.all(10),
        child: Card(color: Colors.blueGrey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Daily cases represented in Bar Chart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
//                  SizedBox(
//                    height: 20,
//                  ),
              Expanded(
                child: charts.BarChart(
                    _getSeriesData(),
                    animate: true,
                    domainAxis: charts.OrdinalAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(labelStyle: charts.TextStyleSpec(fontSize: 1,))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}