import 'package:flutter/material.dart';

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
                ListTile(
                  leading: CircleAvatar(
                    radius: 35.0,
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/5.png",
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  title: Text('Requirement: 50% scholarship FSC',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 500 usd',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'I want to raise funds inorder to complete FSC on 50% scholarship',
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
                          child: Text('Profile',
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
                          child: Text('Donate',
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
                ListTile(
                  leading: CircleAvatar(
                    radius: 35.0,
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/6.jpg",
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  title: Text('Requirement: Primary School Fees',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 20k',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'I want to raise funds of 20,000 for the completion of primary school studies from class 5 to 8th.',
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
                          child: Text('Profile',
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
                          child: Text('Donate',
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
                ListTile(
                  leading: CircleAvatar(
                    radius: 35.0,
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/7.jpg",
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  title: Text('Requirement: College Year Fees',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 30k',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'I want a donation of 30,000 for the FSC 2nd year completion of study.',
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
                          child: Text('Profile',
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
                          child: Text('Donate',
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
                ListTile(
                  leading: CircleAvatar(
                    radius: 35.0,
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/8.jpg",
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  title: Text('Requirement: Tution Fees',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text('Raised: 10k',
                      style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'I want a donation of 10,000 for the FSC 2nd year tution fees for completion of study.',
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
                          child: Text('Profile',
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
                          child: Text('Donate',
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
