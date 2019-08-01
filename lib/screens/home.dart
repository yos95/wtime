import 'package:flutter/material.dart';
import 'package:wtime/services/contraction.dart';
import 'package:wtime/utilities/card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi();
  }

  List<Widget> myContraction = [];

  Contraction contraction = new Contraction();
  Future updateUi() async {
    myContraction = await contraction.query();
    setState(() {
      myContraction;
    });
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
                    Flexible(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            'Tableau des contractions',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      margin: EdgeInsets.all(35.0),
                      padding: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: CustomScrollView(
                        primary: false,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.all(20.0),
                            sliver: SliverGrid.count(
                              crossAxisSpacing: 10.0,
                              crossAxisCount: 2,
                              children: myContraction,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        color: Colors.blueGrey[100],
                        onPressed: () {
                          setState(() async {
                            await Contraction.delete();
                            updateUi();
                          });
                        },
                        child: Text(
                          'Fausse alerte',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(25.0),
                        color: Colors.white,
                        onPressed: () {
                          setState(() async {
                            await Contraction.insert();
                            updateUi();
                          });
                        },
                        child: Text(
                          'AIEE',
                          style: TextStyle(fontSize: 20.0),
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
}
