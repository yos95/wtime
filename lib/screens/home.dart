import 'package:flutter/material.dart';
import 'package:wtime/services/databaseHelper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tableContract = [
    Text('Aucune contraction'),
  ];
  final dbHelper = DatabaseHelper.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wtime"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(35.0),
                      padding: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: tableContract,
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _insert();
                            _query();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          padding: EdgeInsets.all(25.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'AIEE',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: DateTime.now().millisecondsSinceEpoch,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    tableContract.clear();
    allRows.forEach((row) {
      var date = new DateTime.fromMicrosecondsSinceEpoch(row['heure'] * 1000);
      var dateFormater = date.hour.toString() + ':' + date.minute.toString();
      var id = row['_id'].toString();
      print('Id : ' + row['_id'].toString() + 'Heure : ' + dateFormater);

      tableContract.add(Text(
        id + ')  Contraction a   ' + dateFormater,
        style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF8D8E98),
        ),
      ));
    });
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.deleteALL();
    print('deleted $rowsDeleted row(s): row $id');
  }
}
