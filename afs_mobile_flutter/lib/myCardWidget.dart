import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCardWidget extends StatelessWidget {
  MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      width: mediaQuery.size.width * 0.90,
      padding: new EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            color: Color.fromRGBO(255, 250, 250, 1),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: Colors.cyan,
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  title: Text('Required: FSC Yearly Fees',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 400 usd',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'I want to raise funds of 50,000 for the FSC 2nd year completion of study.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Edit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            color: Color.fromRGBO(255, 250, 250, 1),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: Colors.cyan,
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  title: Text('Required: Primary School Funds',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 10k',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'I raise a funds of 10k, as I want my child to complete the primary school studies on the beneficial resources.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Edit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        // child: const Text('Delete',
                        //     style: TextStyle(color: Colors.white)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                        ),

                        shape: new RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            color: Color.fromRGBO(255, 250, 250, 1),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: Colors.cyan,
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  title: Text('Required: Private School Admission',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle:
                      Text('Raised: 8k', style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Funds of 8000 are required to be raised for the managing admission and books for a primary class student.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Edit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            color: Color.fromRGBO(255, 250, 250, 1),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: Colors.cyan,
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  title: Text('Required: College tution Fees',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 15k',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Funds of 1500 are required to be raised for the managing tution fees and books for a primary class student.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Edit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.orange, Colors.pinkAccent],
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Delete',
                              style: TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
