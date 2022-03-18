import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';

class StudentForm extends StatefulWidget {
  @override
  StudentFormState createState() => StudentFormState();
}

class StudentFormState extends State<StudentForm> {
  FSBStatus? _fsbStatus;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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

          bottom: PreferredSize(
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text('Personal',
                        style: TextStyle(color: Colors.white, fontSize: 19)),
                  ),
                  Tab(
                    child: Text('Education',
                        style: TextStyle(color: Colors.white, fontSize: 19)),
                  ),
                  Tab(
                    child: Text('Finance',
                        style: TextStyle(color: Colors.white, fontSize: 19)),
                  ),
                  Tab(
                    child: Text('Family',
                        style: TextStyle(color: Colors.white, fontSize: 19)),
                  ),
                  Tab(
                    child: Text('Bank',
                        style: TextStyle(color: Colors.white, fontSize: 19)),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(65.0)),
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
          screenContents: TabBarView(
            children: [
              PersonalTab(),
              EducationTab(),
              FinanceTab(),
              FamilyTab(),
              BankTab(),
              // EducationTab(),
              // EducationTab(),
              // EducationTab(),
              // EducationTab(),
            ],
          ),
          status: _fsbStatus,
        ),
      ),
    );
  }
}

class PersonalTab extends StatefulWidget {
  @override
  PersonalTabWidget createState() => PersonalTabWidget();
}

//Personal Tab
class PersonalTabWidget extends State {
  String radioButtonItem = 'Male';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Gender',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            radioButtonItem = 'Male';
                                            id = 1;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Male',
                                        style: new TextStyle(fontSize: 15.0),
                                      ),
                                      Radio(
                                        value: 2,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            radioButtonItem = 'Female';
                                            id = 2;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Female',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Radio(
                                        value: 3,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            radioButtonItem = 'Other';
                                            id = 3;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Other',
                                        style: new TextStyle(fontSize: 15.0),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Date of Birth',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'dd----yyyy',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'NIC/Passport/Driving License front side',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'NIC/Passport/Driving License back side',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Status',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Student/Employee/Unemployed',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Education Tab

class EducationTab extends StatefulWidget {
  @override
  EducationTabWidget createState() => EducationTabWidget();
}

class EducationTabWidget extends State {
  String radioButtonItem = 'A';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Institute name',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Institute Name',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Current Class/level',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter current class/level',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Institution affiliation doc',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Gender',
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
                                  left: 45.0, right: 40.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            radioButtonItem = 'A';
                                            id = 1;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Male',
                                        style: new TextStyle(fontSize: 15.0),
                                      ),
                                      Radio(
                                        value: 2,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            radioButtonItem = 'B';
                                            id = 2;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Female',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      Radio(
                                        value: 3,
                                        groupValue: id,
                                        onChanged: (val) {
                                          setState(() {
                                            radioButtonItem = 'C';
                                            id = 3;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Other',
                                        style: new TextStyle(fontSize: 15.0),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Grade proof document',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'School Fee per month',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter school fee',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Fee concessions',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'Enter any concession( if present)',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Paid School Fee receipt',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Finance Tab

class FinanceTab extends StatefulWidget {
  @override
  FinanceTabWidget createState() => FinanceTabWidget();
}

class FinanceTabWidget extends State {
  String radioButtonItem = 'Self Owned';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Total Family Income',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Income',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Income Prove Document',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Guardian',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Name your guardian',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'CellPhone (Guardian)',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Phone no',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: SingleChildScrollView(
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'House OwnerShip Status',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 0.0, top: 2.0),
                            child: new Flexible(
                                child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'Self Owned';
                                          id = 1;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Self Owned',
                                      style: new TextStyle(fontSize: 15.0),
                                    ),
                                    Radio(
                                      value: 2,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'On Rent';
                                          id = 2;
                                        });
                                      },
                                    ),
                                    Text(
                                      'On Rent',
                                      style: new TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Radio(
                                      value: 3,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'Company Owned';
                                          id = 3;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Company Owned',
                                      style: new TextStyle(fontSize: 15.0),
                                    ),
                                    Radio(
                                      value: 4,
                                      groupValue: id,
                                      onChanged: (val) {
                                        setState(() {
                                          radioButtonItem = 'No House';
                                          id = 4;
                                        });
                                      },
                                    ),
                                    Text(
                                      'No House',
                                      style: new TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'House OwnerShip',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Last 3 month Electricity Bills',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                          Text(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Last 3 month Gas bills',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Last 3 month Telephone bills',
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
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 25.0, top: 9.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                      child: Text('CHOOSE FILE'),
                                      onPressed: () async {
                                        var picked = await FilePicker.platform
                                            .pickFiles();

                                        if (picked != null) {
                                          print(picked.files.first.name);
                                        }
                                      }),

                                  // new TextField(
                                  //   decoration: InputDecoration(
                                  //     border: OutlineInputBorder(),
                                  //     hintText: 'No File Chosen',
                                  //   ),
                                  // ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Family Tab
class FamilyTab extends StatefulWidget {
  @override
  FamilyTabWidget createState() => FamilyTabWidget();
}

//Personal Tab
class FamilyTabWidget extends State {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Family Head',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Head of Family Name',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Relation',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Total Family members',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'Mention total family members',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Employed Members',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'No. of earning members',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Siblings Studying',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'No.of siblings studying',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Expenditure on Education',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                            'Fees of all studying members of family ',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Total family Expenditure',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Sum of all expenses',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Any Additional Expenditure (per month)',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Accidental, Insurance, etc.',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Detail of expenses',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintMaxLines: 5,
                                        hintText: 'Type here',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Bank Tab

class BankTab extends StatefulWidget {
  @override
  BankTabWidget createState() => BankTabWidget();
}

class BankTabWidget extends State {
  String radioButtonItem = 'Male';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Associated Bank Account ',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Allied Bank Limited',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 45.0, top: 1.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Branch Code (if applicable)',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Account ',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Account Number',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 45.0, top: 1.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Account Title/Owner',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Associated Contact no * ',
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
                                  left: 45.0, right: 45.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Mention linked contact no',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
