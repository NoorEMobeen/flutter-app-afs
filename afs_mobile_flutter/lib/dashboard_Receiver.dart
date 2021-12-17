//import 'package:afs_mobile_flutter/History_Page.dart';
//import 'package:afs_mobile_flutter/myCardWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:afs_mobile_flutter/Person.dart';
//import 'package:afs_mobile_flutter/ui/widgets/custom_shape.dart';

class DashboardReceiver extends StatefulWidget {
  @override
  _DashboardReceiverState createState() => _DashboardReceiverState();
}

class _DashboardReceiverState extends State<DashboardReceiver> {
  List<Person> persons = [
    Person(
        name: 'Bill Will',
        title: 'Required: FSC Yearly Fees',
        profileImg: 'assets/images/1.png',
        reqAmount: '12000',
        collectAmount: '5000',
        status: 'Active',
        deadline: '20 days'),
    Person(
        name: 'John Wahi',
        title: 'Required: Primary School Funds',
        profileImg: "assets/images/2.jpg",
        reqAmount: '10000',
        collectAmount: '2000',
        status: 'Active',
        deadline: '24 days'),
    Person(
        name: 'Emma Watson',
        title: 'Required: Tution Fees',
        profileImg: "assets/images/3.jpg",
        reqAmount: '22000',
        collectAmount: '10000',
        status: 'Active',
        deadline: '10 days'),
    Person(
        name: 'Shely Jane',
        title: 'Required: Books & uniform college ',
        profileImg: "assets/images/4.jpg",
        reqAmount: '8000',
        collectAmount: '5000',
        status: 'Active',
        deadline: '20 days'),
    Person(
        name: 'Saffar Khan',
        title: 'Required: 5th class Fees',
        profileImg: "assets/images/5.png",
        reqAmount: '9000',
        collectAmount: '8000',
        status: 'Active',
        deadline: '5 days'),
    Person(
        name: 'Asam Shahid',
        title: 'Required: FSC Yearly Fees',
        profileImg: "assets/images/6.jpg",
        reqAmount: '9000',
        collectAmount: '1200',
        status: 'Active',
        deadline: '7 days'),
    Person(
        name: 'Wahid Sheryar',
        title: 'Required: College Yearly Fees',
        profileImg: "assets/images/7.jpg",
        reqAmount: '23000',
        collectAmount: '5000',
        status: 'Active',
        deadline: '10 days'),
  ];

  FSBStatus? _fsbStatus;

  // ignore: non_constant_identifier_names
  Widget personDetailCard(Person) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 50.0,
                    height: 50.0,

                    // child: ClipRect(
                    //   child: Image.asset(
                    //     "assets/images/2.jpg",
                    //   ),
                    // ),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Person.profileImg)))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Person.name,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    Person.title,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    Person.status,
                    style: TextStyle(color: Colors.green, fontSize: 10),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    'Requested Funds: ' + Person.reqAmount,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Collected: ' + Person.reqAmount,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(Person.deadline,
                      style: TextStyle(color: Colors.red, fontSize: 11)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          title: Text('Receiver Dashboard'),
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
          screenContents: dashboardScreen(),
          status: _fsbStatus,
        ),
      ),
    );
  }

  dashboardScreen() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                //margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                children: persons.map((p) {
          return personDetailCard(p);
        }).toList())),
      ),
    );
  }
}
