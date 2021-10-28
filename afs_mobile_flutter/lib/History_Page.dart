import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:afs_mobile_flutter/custom_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';

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
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // Widget for the search
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(widget.list));
              },
              icon: Icon(Icons.search),
            ),
            // Widget for implementing the three-dot menu
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
          backgroundColor: Colors.blue,
          title: const Text('HISTORY'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child:
                    Text('TRANSACTIONS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('DONATIONS', style: TextStyle(color: Colors.white)),
              ),
            ],
            labelColor: Colors.white,
          ),
        ),

        // ! THE DESIGNED BODY
        body: const TabBarView(
          children: [
            ChatsTab(),
            ChatsTab(),
          ],
        ),
        //     FoldableSidebarBuilder(
        //   drawerBackgroundColor: Colors.cyan[100],
        //   drawer: CustomSidebarDrawer(
        //     drawerClose: () {
        //       setState(() {
        //         _fsbStatus = FSBStatus.FSB_CLOSE;
        //       });
        //     },
        //   ),
        //   screenContents: HomePage(),
        //   status: _fsbStatus,
        // ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red[400],
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleChatWidget(
              chatTitle: "Saffar Khan - Zohran",
              chatMessage: 'Rs 9,000/-',
            ),
            Divider(
              color: Colors.black,
            ),
            SingleChatWidget(
              chatTitle: "Asad - Saif",
              chatMessage: 'Rs 12,000/-',
            ),
            Divider(
              color: Colors.black,
            ),
            SingleChatWidget(
              chatTitle: "Pawan - Hassan",
              chatMessage: 'Rs 7,000/-',
            ),
            Divider(
              color: Colors.black,
            ),
            SingleChatWidget(
              chatTitle: "Hasnain - Zohran",
              chatMessage: 'Rs 6,000/-',
            ),
            Divider(
              color: Colors.black,
            ),
            SingleChatWidget(
              chatTitle: "Abbas - Rizwan",
              chatMessage: 'Rs 8,000/-',
            ),
            Divider(
              color: Colors.black,
            ),
            SingleChatWidget(
              chatTitle: "Zohran - Tehmoor",
              chatMessage: 'Rs 10,000/-',
            ),
          ],
        ),
      ),
    );
  }
}

//Search bar Function
class Search extends SearchDelegate {
  String selectedResult = "";
  List<String> recentList = ["Saffar", "Asad", "Saif", "Zohran", "Abbas"];
  final List<String> listExample;
  Search(this.listExample);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList
            .addAll(listExample.where((element) => element.contains(query)));

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              suggestionList[index],
            ),
            onTap: () {
              selectedResult = suggestionList[index];
              showResults(context);
            },
          );
        });
  }
}

// Widget to define how a single chat widget would look like
class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;

  const SingleChatWidget({
    Key? key,
    this.chatMessage,
    this.chatTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CircleAvatar(
        //   radius: 30,
        //   backgroundImage: NetworkImage(imageUrl!),
        // ),
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    '21/10/2021',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
