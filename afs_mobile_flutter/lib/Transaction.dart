import 'dart:math';

import 'package:afs_mobile_flutter/transactionData.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
//import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:afs_mobile_flutter/constants/constants.dart';

class HomePage extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FSBStatus? _fsbStatus;

  final String url = '$server/student/withdraws';
  getUserData() async {
    var currentTok = await FirebaseAuth.instance.currentUser?.getIdToken();
    debugPrint(currentTok);
    var response =
        await http.get(Uri.parse(url), headers: {'authorization': currentTok!});
    Iterable data = json.decode(response.body);

    // print('tjiiis is data' + response.body);
    // print("Printed Data " + data.length.toString());
    List<TransactionData> users = <TransactionData>[];
    for (int i = 0; i < data.length; i++) {
      //for (var u in v.values) {
      // print("VVVVV" + data.elementAt(i)["FullName"]);
      TransactionData user = TransactionData(
        data.elementAt(i)["FullName"].toString(),
        data.elementAt(i)["Amount"].toString(),
        data.elementAt(i)["DeadlineDay"].toString(),
        data.elementAt(i)["approved_at"].toString(),
      );
      users.add(user);
      // print("WE are printing users HEREEEE: " + '$users');
      // }
    }
    //// print("Hello");
    //print("Hello this is User : " + users[0].FullName);
    print(users.length.toString());
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
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
          title: Text('Transactions'),
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
  // Widget openPopUp() {
  //   return PopupMenuButton(
  //     itemBuilder: (context) {
  //       return List.generate(
  //           2,
  //           (index) => const PopupMenuItem(
  //                 child: Text('Setting'),
  //               ));
  //     },
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {

//     return DefaultTabController(
//       length: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: new IconButton(
//             icon: new Icon(Icons.menu),
//             onPressed: () => setState(() {
//               _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
//                   ? FSBStatus.FSB_CLOSE
//                   : FSBStatus.FSB_OPEN;
//             }),
//           ),

//           // leading: Icon(Icons.menu),
//           title: Text('Transaction'),
//           backgroundColor: Colors.redAccent,
//         ),
//         body: FoldableSidebarBuilder(
//           drawerBackgroundColor: Colors.cyan[100],
//           drawer: CustomSidebarDrawer(
//             drawerClose: () {
//               setState(() {
//                 _fsbStatus = FSBStatus.FSB_CLOSE;
//               });
//             },
//           ),
//           screenContents: Transaction(),
//           status: _fsbStatus,
//         ),
//       ),
//     );
//   }
// }

//class Transaction extends StatelessWidget {

  Widget dashboardScreen() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white30,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 8)
              ],
              // border: Border.all(
              //   color: Colors.black,

              //   //  width: 500,
              // )
            ),
            child: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    //print('Saffar Khan');
                    return Center(child: Text('Error in loading Items'));
                  } else if (snapshot.hasData) {
                    List<TransactionData> transData =
                        snapshot.data! as List<TransactionData>;
                    return transData.length > 0
                        ? ListView.builder(
                            itemCount: transData.length,
                            itemBuilder: (context, i) {
                              return Center(
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white70, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          //  ListTile(
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(children: <Widget>[
                                              Text(
                                                '${transData.elementAt(i).FullName}',
                                                style: GoogleFonts.josefinSans(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 90),
                                              Text(
                                                'Requested: '
                                                '${transData.elementAt(i).Amount}',
                                                textAlign: TextAlign.end,
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ]),
                                            // Row(

                                            // title: Text(
                                            //   '${transData.elementAt(i).FullName}',
                                            //   style: GoogleFonts.josefinSans(
                                            //     textStyle: TextStyle(
                                            //       fontWeight: FontWeight.bold,
                                            //       color: Colors.white,
                                            //       fontSize: 22,
                                            //     ),
                                            //   ),
                                            // ),
                                            // subtitle: Text(
                                            //   'Requested Amount: '
                                            //   '${transData.elementAt(i).Amount}',
                                            //   textAlign: TextAlign.start,
                                            //   style: GoogleFonts.openSans(
                                            //     textStyle: TextStyle(
                                            //         color: Colors.black,
                                            //         fontSize: 14,
                                            //         fontWeight:
                                            //             FontWeight.bold),
                                            //   ),
                                            // ),

                                            // ),
                                          ),
                                          //Expanded(
                                          const Divider(
                                            thickness:
                                                1, // thickness of the line
                                            indent: 0,
                                            // empty space to the leading edge of divider.
                                            endIndent:
                                                0, // empty space to the trailing edge of the divider.
                                            color: Color.fromRGBO(0, 0, 0,
                                                1), // The color to use when painting the line.
                                            // The divider's height extent.
                                          ),
                                          //),

                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              'Deadline: '
                                              '${transData.elementAt(i).DeadlineDay}',
                                              style: GoogleFonts.rubik(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //SizedBox(width: 30),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                'Approved_at: '
                                                '${transData.elementAt(i).Approved_at.split('@')[0]}',
                                                style: GoogleFonts.ptSerif(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                          //  ],
                                          //  ),
                                          //),

                                          const Divider(
                                            thickness:
                                                3, // thickness of the line
                                            indent:
                                                0, // empty space to the leading edge of divider.
                                            endIndent:
                                                0, // empty space to the trailing edge of the divider.
                                            color: Colors
                                                .black, // The color to use when painting the line.
                                            height:
                                                20, // The divider's height extent.
                                          ),
                                        ],
                                      )),
                                ),

                                // child: SingleChatWidget(
                                //   chatTitle:
                                //       '${transData.elementAt(i).FullName}',
                                //   chatMessage:
                                //       '${transData.elementAt(i).Amount}/-',
                                //   chatDate:
                                //       '${transData.elementAt(i).DeadlineDay}',
                                //   approvedAt:
                                //       '${transData.elementAt(i).Approved_at}',
                                // ),
                              );
                            },
                          )
                        : const Center(child: Text('No items'));
                  }
                  return Center(child: Text('No items'));
                }),
          ),
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 1,
  //     child: Scaffold(
  //       body: Container(
  //         decoration: const BoxDecoration(
  //           gradient: LinearGradient(
  //               // begin: Alignment.topLeft,
  //               //  end: Alignment.bottomRight,
  //               colors: [Colors.white10, Colors.pinkAccent]),
  //         ),
  //         child: TabBarView(
  //           children: [ChatsTab()],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // setState(Null Function() param0) {}
//}

// class SingleChatWidget extends StatelessWidget {
//   final String? chatMessage;
//   final String? chatTitle;
//   final String? chatDate;
//   final String? approvedAt;

//   const SingleChatWidget({
//     Key? key,
//     this.chatMessage,
//     this.chatTitle,
//     this.chatDate,
//     this.approvedAt,
//   }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: ListTile(
  //           title: Text('$chatTitle',
  //               style: const TextStyle(fontWeight: FontWeight.w600)),
  //           subtitle: Row(children: [
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.only(left: 6.0),
  //                 child: Text(
  //                   '$chatMessage',
  //                 ),
  //               ),
  //             ),
  //           ]),
  //           trailing: Column(
  //             children: [
  //               Expanded(
  //                   child: Padding(
  //                 padding: const EdgeInsets.only(top: 8.0),
  //                 child: Text(
  //                   '$chatDate',
  //                 ),
  //               )),
  //               Expanded(
  //                   child: Padding(
  //                 padding: const EdgeInsets.only(top: 8.0),
  //                 child: Text('$approvedAt'),
  //               )),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Divider(
  //         thickness: 3, // thickness of the line
  //         indent: 0,
  //         // empty space to the leading edge of divider.
  //         endIndent: 0, // empty space to the trailing edge of the divider.
  //         color: Colors.black, // The color to use when painting the line.
  //         // The divider's height extent.
  //       ),
  //       //),
  //     ],
  //   );
  // }
//}
}
