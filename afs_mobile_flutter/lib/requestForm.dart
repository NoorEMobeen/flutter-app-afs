import 'package:flutter/material.dart';

import 'History_Page.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => new _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  FSBStatus? _fsbStatus;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => setState(() {
            _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
                ? FSBStatus.FSB_CLOSE
                : FSBStatus.FSB_OPEN;
          }),
        ),

        // leading: Icon(Icons.menu),
        title: Text('Fund Request'),
        backgroundColor: Colors.redAccent,
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            itemBuilder: (context) {
              return [
                // In this case, we need 5 popupmenuItems one for each option.
                const PopupMenuItem(child: Text('Settings')),
              ];
            },
          ),
        ],
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
        screenContents: Form(),
        status: _fsbStatus,
      ),
    );
  }
}

// ignore: must_be_immutable
class Form extends StatelessWidget {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Text(
                  'Funds Request',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  //color: Colors.blue,
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  // color: Colors.blue,
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 10),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Requested amount',
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),

                  Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20.0,
                  ),
                  // ignore: deprecated_member_use
                ],
              ),
            ),
            // ListTile(
            //   leading: const Icon(Icons.today),
            //   title: const Text(
            //     'Deadline',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   subtitle: const Text(
            //     'November 18, 2021',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   //trailing: const Icon(Icons.check_circle, color: Colors.green,),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                  child: TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a Message Here',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.pinkAccent],
                  ),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(top: 50),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'Request',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setState(Null Function() param0) {}
}
