// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/donor_sidebar_drawer.dart';
//import 'pay.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';

class DonorAccounts extends StatefulWidget {
  @override
  DonorAccountsState createState() => DonorAccountsState();
}

class DonorAccountsState extends State<DonorAccounts> {
  final _formKey = GlobalKey<FormState>();
  FSBStatus? _fsbStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => setState(() {
            _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
                ? FSBStatus.FSB_CLOSE
                : FSBStatus.FSB_OPEN;
          }),
        ),

        // leading: Icon(Icons.menu),
        title: Text('Profile'),
        actions: [
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.cyan[100],
        drawer: CustomSidebarDrawer(
          drawerClose: () {
            setState(() {
              _fsbStatus = FSBStatus.FSB_CLOSE;
            });
          },
        ),
        screenContents: accountScreen(),
        status: _fsbStatus,
      ),
    );
  }

  Widget accountScreen() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            // begin: Alignment.topLeft,
            //  end: Alignment.bottomRight,
            colors: [Colors.white10, Colors.pinkAccent]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 100.0, bottom: 50.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 8)
                      ],
                      border: Border.all(
                        color: Colors.black,
                        //  width: 500,
                      )),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 70.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Accounts',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 3, // thickness of the line
                          indent: 30,
                          // empty space to the leading edge of divider.
                          endIndent: 30,
                          // empty space to the trailing edge of the divider.
                          color: Colors
                              .black, // The color to use when painting the line.
                          // The divider's height extent.
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 45.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Required Amount',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 85.0, right: 45.0, top: 10.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                new Flexible(
                                  child: new Text('Rs 00/-'

                                      // decoration: InputDecoration(
                                      //   //border: OutlineInputBorder(),
                                      //   hintText: 'Rs 00/-',
                                      // ),
                                      ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 45.0, right: 45.0, top: 20.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '00',
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        new Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              //color: Colors.grey,
                              gradient: LinearGradient(
                                colors: [Colors.blueGrey, Colors.blueAccent],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.only(top: 50, bottom: 50),
                          // padding: const EdgeInsets.only(
                          //     left: 40.0, top: 40.0, bottom: 50),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Donate',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
