// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';

class ReceiverAccounts extends StatefulWidget {
  @override
  ReceiverAccountsState createState() => ReceiverAccountsState();
}

class ReceiverAccountsState extends State<ReceiverAccounts> {
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
        title: Text('Student Account'),
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
            body: Container(
                child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth',
                      labelText: 'Dob',
                    ),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: null,
                      )),
                ],
              ),
            ))));
  }
}
