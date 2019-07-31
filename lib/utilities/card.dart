import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.id, this.date});
  String id;
  String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              id + '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(date, style: TextStyle(fontSize: 17, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
