import 'package:afs_mobile_flutter/ui/transactionData.dart';
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
            3,
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: const TabBarView(
          children: [ChatsTab()],
        ),
      ),
    );
  }

  setState(Null Function() param0) {}
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  final String url = 'http://192.168.56.1:5000/student/withdraws';
  getUserData() async {
    var currentTok = await FirebaseAuth.instance.currentUser?.getIdToken();

    debugPrint(currentTok);
    var response =
        await http.get(Uri.parse(url), headers: {'authorization': currentTok!});
    var data = jsonDecode(response.body);

    List<TransactionData> users = [];
    for (var v in data.values) {
      for (var u in v.values) {
        TransactionData user =
            TransactionData(u["from"], u["amount"], u["to"], u["datetime"]);
        users.add(user);
      }
    }
    print(users[0].datetime);
    debugPrint(users.length.toString());
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error in loading Items'));
              } else if (snapshot.hasData) {
                List<TransactionData> transData =
                    snapshot.data! as List<TransactionData>;
                return transData.length > 0
                    ? ListView.builder(
                        itemBuilder: (context, i) {
                          return Center(
                            child: SingleChatWidget(
                              chatTitle: '${transData.elementAt(i).from} - ${transData.elementAt(i).to}',
                              chatMessage: '${transData.elementAt(i).datetime}/-',
                              chatDate: '${transData.elementAt(i).amount}/-',
                            ),
                          );
                        },
                      )
                    : const Center(child: Text('No items'));
              }
              return Center(child: Text('No items'));
            }),
      ),
    );
  }
}

// Widget to define how a single chat widget would look like
class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final String? chatDate;

  const SingleChatWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
    this.chatDate
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
            trailing: Row(
              children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    '$chatDate',
                  ),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}