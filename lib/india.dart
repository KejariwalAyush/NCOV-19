import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';

class India extends StatelessWidget {
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
                      style: TextStyle(fontFamily: fontName,
                          color: Colors.blue, fontSize: 28),
                      children: <TextSpan>[
                        TextSpan(text: ' Stats',
                          style: TextStyle(
                              color: Colors.black38, fontSize: 20),
                        )
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Cases',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          Text('$tcaseind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Recovered',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          Text('$recovind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Deaths',style: TextStyle(fontSize: 20,color: Colors.white60),textAlign: TextAlign.center,),
                          Text('$deathind',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(height: 10,),
                PieChart(),
                Divider(height: 10,),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(10),
//                  margin: EdgeInsets.all(5),
                  width: double.maxFinite,
                  height: 400,
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
                          DataColumn(label: Text('Recovered'),numeric: true),
                          DataColumn(label: Text('Deaths'),numeric: true,),
                        ],
                        rows: [for(int i=1;i<states.length;i++)
                          DataRow(cells:[
                            DataCell(Text('${states[i]}',softWrap: true,)),
                            DataCell(Text('${stateData[i]}',)),
                            DataCell(Text('${stateRecov[i]}')),
                            DataCell(Text('${stateDeath[i]}',)),
                          ])
                        ],
                      ),
                  ),
                ),
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
                    "Total data in represented in PIE Chart",
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