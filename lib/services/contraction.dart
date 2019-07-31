import 'package:flutter/material.dart';
import 'package:wtime/utilities/card.dart';
import 'package:wtime/utilities/constant.dart';

import 'databaseHelper.dart';

class Contraction {
  static insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: DateTime.now().millisecondsSinceEpoch,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  Future<List<Widget>> query() async {
    List<Widget> tableContract = [];
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    tableContract.clear();
    allRows.forEach((row) {
      var date = new DateTime.fromMicrosecondsSinceEpoch(row['heure'] * 1000);
      var dateFormater = date.hour.toString() + ':' + date.minute.toString();
      var id = row['_id'].toString();
      print('Id : ' + row['_id'].toString() + 'Heure : ' + dateFormater);

      tableContract.add(new CustomCard(
        date: dateFormater,
        id: id,
      ));
    });
    return tableContract;
  }

  static delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.deleteALL();
    print('deleted $rowsDeleted row(s): row $id');
  }
}
