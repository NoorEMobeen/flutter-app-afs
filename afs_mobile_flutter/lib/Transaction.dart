import 'package:afs_mobile_flutter/transactionData.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
//import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FSBStatus? _fsbStatus;
  Widget openPopUp() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return List.generate(
            2,
            (index) => const PopupMenuItem(
                  child: Text('Setting'),
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
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
          title: Text('Transaction'),
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
          screenContents: Transaction(),
          status: _fsbStatus,
        ),
      ),
    );
  }
}

class Transaction extends StatelessWidget {
  final String url = 'http://10.102.128.123:5000/student/withdraws';
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              // begin: Alignment.topLeft,
              //  end: Alignment.bottomRight,
              colors: [Colors.white10, Colors.pinkAccent]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 150.0),
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.white,
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
                                child: SingleChatWidget(
                                  chatTitle:
                                      '${transData.elementAt(i).FullName}',
                                  chatMessage:
                                      '${transData.elementAt(i).Amount}/-',
                                  chatDate:
                                      '${transData.elementAt(i).DeadlineDay}',
                                  approvedAt:
                                      '${transData.elementAt(i).Approved_at}',
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

  setState(Null Function() param0) {}
}

// class ChatsTab extends StatelessWidget {
//   const ChatsTab({Key? key}) : super(key: key);

//   final String url = 'http://10.102.136.127:5000/student/withdraws';
//   getUserData() async {
//     var currentTok = await FirebaseAuth.instance.currentUser?.getIdToken();
//     debugPrint(currentTok);
//     var response =
//         await http.get(Uri.parse(url), headers: {'authorization': currentTok!});
//     var data = json.decode(response.body);
//     print('tjiiis is data' + response.body);
//     List<TransactionData> users = [];
//     for (var v in data) {
//       // for (var u in v.values) {
//       TransactionData user = TransactionData(
//           v["FullName"], v["Amount"], v["DeadlineDay"], v["approved_at"]);
//       users.add(user);
//       print("WE are printing users HEREEEE: " + '$users');
//       // }
//     }
//     print("Hello");
//     print("Hello this is User : " + users[0].FullName);
//     debugPrint(users.length.toString());
//     return users;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               // begin: Alignment.topLeft,
//               //  end: Alignment.bottomRight,
//               colors: [Colors.white10, Colors.pinkAccent]),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: FutureBuilder(
//               future: getUserData(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   //print('Saffar Khan');
//                   return Center(child: Text('Error in loading Items'));
//                 } else if (snapshot.hasData) {
//                   List<TransactionData> transData =
//                       snapshot.data! as List<TransactionData>;
//                   return transData.length > 0
//                       ? ListView.builder(
//                           itemBuilder: (context, i) {
//                             return Center(
//                               child: SingleChatWidget(
//                                 chatTitle: '${transData.elementAt(i).FullName}',
//                                 chatMessage:
//                                     '${transData.elementAt(i).Amount}/-',
//                                 chatDate:
//                                     '${transData.elementAt(i).DeadlineDay}',
//                               ),
//                             );
//                           },
//                         )
//                       : const Center(child: Text('No items'));
//                 }
//                 return Center(child: Text('No items'));
//               }),
//         ),
//       ),
//     );
//   }

// }

//Search bar Function
// class Search extends SearchDelegate {
//   String selectedResult = "";
//   List<String> recentList = ["Saffar", "Asad", "Saif", "Zohran", "Abbas"];
//   final List<String> listExample;
//   Search(this.listExample);
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//         icon: Icon(Icons.close),
//         onPressed: () {
//           query = "";
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text(selectedResult),
//       ),
//     );
//   }
//l
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestionList = [];
//     query.isEmpty
//         ? suggestionList = recentList
//         : suggestionList
//             .addAll(listExample.where((element) => element.contains(query)));
//
//     return ListView.builder(
//         itemCount: suggestionList.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               suggestionList[index],
//             ),
//             onTap: () {
//               selectedResult = suggestionList[index];
//               showResults(context);
//             },
//           );
//         });
//   }
// }

// Widget to define how a single chat widget would look like

class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final String? chatDate;
  final String? approvedAt;

  const SingleChatWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
    this.chatDate,
    this.approvedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text('$chatTitle',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    '$chatMessage',
                  ),
                ),
              ),
            ]),
            trailing: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$chatDate',
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('$approvedAt'),
                )),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 3, // thickness of the line
          indent: 0,
          // empty space to the leading edge of divider.
          endIndent: 0, // empty space to the trailing edge of the divider.
          color: Colors.black, // The color to use when painting the line.
          // The divider's height extent.
        ),
        //),
      ],
    );
  }
}
