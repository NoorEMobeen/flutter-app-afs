import 'dart:convert';
import 'dart:math';
//import 'package:afs_mobile_flutter/student_form.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:afs_mobile_flutter/Person.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:afs_mobile_flutter/ui/widgets/custom_shape.dart';
class DashboardReceiver extends StatefulWidget {
  @override
  _DashboardReceiverState createState() => _DashboardReceiverState();
}

class _DashboardReceiverState extends State<DashboardReceiver> {
  late String name, title, aStatus, reqFund, colFund, deadline;

  FSBStatus? _fsbStatus;
  final String url = 'http://192.168.10.55:5000/requests/active';
  getUserData() async {
    var currentTok = await FirebaseAuth.instance.currentUser?.getIdToken();

    debugPrint(currentTok);
    var response =
        await http.get(Uri.parse(url), headers: {'authorization': currentTok!});
    var data = jsonDecode(response.body);

    List<Person> users = [];

    for (var u in data.values) {
      Person user = Person(u["FullName"], u["RequestTitle"], u["RequestAmount"],
          u["ReasonDetail"], u["status"], u["DeadlineTime"]);

      users.add(user);
    }
    print(users);
    debugPrint(users.length.toString());
    return users;
  }

  // ignore: non_constant_identifier_names
  // Widget personDetailCard(Person) {
  //   return Column(
  //     // padding: const EdgeInsets.all(10.0),
  //     children: <Widget>[
  //       GestureDetector(
  //         child: Card(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.vertical(
  //               bottom: Radius.circular(20),
  //             ),
  //           ),
  //           color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Row(
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Container(
  //                       width: 50.0,
  //                       height: 50.0,
  //                       decoration: new BoxDecoration(
  //                           shape: BoxShape.circle,
  //                           image: new DecorationImage(
  //                               fit: BoxFit.cover,
  //                               image: AssetImage(Person.profileImg)))),
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     // Text(
  //                     //   Person.name,
  //                     //   style: TextStyle(color: Colors.white, fontSize: 19),
  //                     // ),
  //                     Text(
  //                       Person.title,
  //                       style: TextStyle(color: Colors.white, fontSize: 19),
  //                     ),
  //                     Text(
  //                       Person.status,
  //                       style: TextStyle(color: Colors.green, fontSize: 16),
  //                     ),
  //                     Text(
  //                       'Requested Funds: ' + Person.reqAmount,
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       'Collected: ' + Person.reqAmount,
  //                       style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(Person.deadline,
  //                         style: TextStyle(color: Colors.red, fontSize: 13)),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         onTap: () => Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => StudentForm())),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

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
          // screenContents: Center(
          //     child: ElevatedButton(
          //   child: Text('Click Me'),
          //   onPressed: () {
          //     //getUser();
          //     getUserData();
          //   },
          // )),
          screenContents: dashboardScreen(),
          status: _fsbStatus,
        ),
      ),
    );
  }

  Widget dashboardScreen() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FutureBuilder(
                                future: getUserData(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container(
                                      child: Center(
                                        child: Text("loading one"),
                                      ),
                                    );
                                  } else {
                                    // print(snapshot.data);

                                    List<Person> persons =
                                        (snapshot.data! as List<Person>);
                                    return ListView.builder(
                                        itemCount: persons.length,
                                        itemBuilder: (context, i) {
                                          print(persons[i].name);
                                          return ListTile(
                                            // title: Text(persons[i].name),

                                            title: Text(
                                              persons[i].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                            subtitle: Text(
                                              persons[i].status,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16),
                                            ),

                                            trailing: Text(
                                              'Requested Funds: ' +
                                                  persons[i].reqAmount,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            leading: Text(
                                              'Collected: ' +
                                                  persons[i].collectAmount,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            //  Text(Person.deadline,
                                            //       style: TextStyle(color: Colors.red, fontSize: 13)),
                                          );
                                        });
                                  }
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
