import 'package:flutter/material.dart';
import 'package:flutter_app/splash.dart';

// ignore: camel_case_types
class helpPage extends StatelessWidget {
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
                    text: 'HELPLINE',
                    style: TextStyle(fontFamily: fontName,
                        color: Colors.blue, fontSize: 28),
                    children: <TextSpan>[
                      TextSpan(text: ' Numbers',
                        style: TextStyle(
                            color: Colors.black38, fontSize: 20),
                      )
                    ]
                ),
              ),
              Divider(height: 10,),
              Container(
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
                        DataColumn(label: Text('Phone Nos.'),numeric: true,),
                      ],
                      rows: [for(int i=1;i<state.length;i++)
                        DataRow(cells:[
                          DataCell(Text('${state[i]}',softWrap: true,)),
                          DataCell(SelectableText('${phone[i]}',textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blueAccent,),
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false
                            ),
                          ),
                          ),
                        ],
                        ),
                      ],
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
