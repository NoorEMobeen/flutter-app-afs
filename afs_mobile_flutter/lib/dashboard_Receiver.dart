// ignore_for_file: deprecated_member_use

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
import 'package:google_fonts/google_fonts.dart';

//import 'package:afs_mobile_flutter/ui/widgets/custom_shape.dart';
class DashboardReceiver extends StatefulWidget {
  @override
  _DashboardReceiverState createState() => _DashboardReceiverState();
}

class _DashboardReceiverState extends State<DashboardReceiver> {
  FSBStatus? _fsbStatus;
  final String url = 'http://192.168.10.55:5000/requests/active';
  getUserData() async {
    var currentTok = await FirebaseAuth.instance.currentUser?.getIdToken();

    debugPrint(currentTok);
    var response =
        await http.get(Uri.parse(url), headers: {'authorization': currentTok!});
    var data = jsonDecode(response.body);

    List<Person> users = [];
    for (var v in data.values) {
      for (var u in v.values) {
        Person user = Person(
            u["FullName"],
            u["RequestTitle"],
            u["RequestAmount"],
            u["created_at"],
            u["published_at"],
            u["status"],
            u["DeadlineTime"],
            u["ReasonDetail"]);
        users.add(user);
      }
    }
    print(users[0].title);
    debugPrint(users.length.toString());
    return users;
  }

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
          // actions: [
          //   Icon(Icons.more_vert),
          // ],
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

  Widget dashboardScreen() {
    // Colors.primaries[Random().nextInt(Colors.primaries.length)]
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white10,
                    border: Border.all(
                      color: Colors.black12,
                    )),
                child: FutureBuilder(
                    future: getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error in loading Items'));
                      } else if (snapshot.hasData) {
                        List<Person> persons = snapshot.data! as List<Person>;
                        return persons.length > 0
                            ? ListView.builder(
                                padding: EdgeInsets.all(16.0),
                                itemCount: persons.length,
                                itemBuilder: (context, i) {
                                  return Center(
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                      ),
                                      color: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)],
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: <Widget>[
                                              ListTile(
                                                title: Text(
                                                  '${persons.elementAt(i).title}',
                                                  style: GoogleFonts.rubik(
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 19,
                                                    ),
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  'Request amount: ${persons.elementAt(i).reqAmount}',
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),

                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      '${persons.elementAt(i).name}',
                                                      style: GoogleFonts.rubik(
                                                        textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 50),
                                                    Text(
                                                        '${persons.elementAt(i).status}',
                                                        style:
                                                            GoogleFonts.ptSerif(
                                                          textStyle: TextStyle(
                                                              color: Colors
                                                                  .lightGreen,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                ),
                                              ),

                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Center(
                                                  child: Text(
                                                    '${persons.elementAt(i).description}',
                                                    style: GoogleFonts.rubik(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 19,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ButtonBar(
                                                alignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  FlatButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Pause',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Stop',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Text(.com
                                              //   '${persons.elementAt(i).name}',
                                              //   style: TextStyle(
                                              //       color: Colors.white,
                                              //       fontSize: 19),
                                              // ),
                                              // SizedBox(height: 5),

                                              // SizedBox(height: 5),
                                              // //  Row(children: <Widget>[
                                              // Text(
                                              //     '${persons.elementAt(i).status}',
                                              //     style: GoogleFonts.ptSerif(
                                              //       textStyle: TextStyle(
                                              //           color:
                                              //               Colors.lightGreen,
                                              //           fontSize: 17,
                                              //           fontWeight:
                                              //               FontWeight.bold),
                                              //     )),
                                              // SizedBox(height: 5),
                                              // Text(
                                              //     'created_at: ${persons.elementAt(i).createdAt}',
                                              //     style: GoogleFonts.ptSerif(
                                              //       textStyle: TextStyle(
                                              //           color: Colors.white,
                                              //           fontSize: 17),
                                              //     )),

                                              // SizedBox(height: 5),

                                              // Text(
                                              //   'Published_at: ${persons.elementAt(i).publishedAt}',
                                              //   style: GoogleFonts.lato(
                                              //     textStyle: TextStyle(
                                              //         color: Colors.white,
                                              //         fontSize: 18,
                                              //         fontWeight:
                                              //             FontWeight.bold),
                                              //   ),
                                              // ),

                                              // // SizedBox(height: 5),
                                              // // Text(
                                              // //     'Collected: ${persons.elementAt(i).collectAmount}',
                                              // //     style: TextStyle(
                                              // //         color: Colors.white,
                                              // //         fontSize: 15,
                                              // //         fontWeight:
                                              // //             FontWeight.bold)
                                              // //             ),
                                              // SizedBox(height: 5),
                                              // Text(
                                              //   'Deadline: ${persons.elementAt(i).deadline}',
                                              //   style: GoogleFonts.lato(
                                              //     textStyle: TextStyle(
                                              //         color: Colors.red,
                                              //         fontSize: 16),
                                              //   ),
                                              // ),
                                            ],
                                          )),
                                    ),
                                  );
                                },
                              )
                            : const Center(child: Text('No items'));
                      }
                      return Center(child: Text('No items'));
                    }),
              ),
            ),
          ])),
    );
  }
}
