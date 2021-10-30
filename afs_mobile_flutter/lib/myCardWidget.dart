import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      padding: new EdgeInsets.all(10.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(

            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person, size: 60),
                  title: Text('FSC Year Fees',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'I want to raise funds of 50,000 for the FSC 2nd year completion of study.',
                      style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Edit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink,
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person, size: 60),
                  title: Text('5th Class Educational Resources',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                      'I want to raise funds of 10,000 for the 5th Class student for the resources required for study.',
                      style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Edit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink,
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person, size: 60),
                  title: Text('5th Class Educational Resources',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                      'I want to raise funds of 10,000 for the 5th Class student for the resources required for study.',
                      style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Edit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.pink,
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.person, size: 60),
                  title: Text('5th Class Educational Resources',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                      'I want to raise funds of 10,000 for the 5th Class student for the resources required for study.',
                      style: TextStyle(color: Colors.white)),
                ),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Edit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: const Text('Delete',
                            style: TextStyle(color: Colors.white)),
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
