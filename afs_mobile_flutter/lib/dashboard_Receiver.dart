//import 'package:afs_mobile_flutter/History_Page.dart';
import 'package:afs_mobile_flutter/myCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/custom_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:afs_mobile_flutter/ui/widgets/custom_shape.dart';

class DashboardReceiver extends StatefulWidget {
  @override
  _DashboardReceiverState createState() => _DashboardReceiverState();
}

class _DashboardReceiverState extends State<DashboardReceiver> {
  double _height = 0;
  double _width = 0;
  bool _large = true;
  bool _medium = true;
  FSBStatus? _fsbStatus;

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
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
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

  Widget dashboardScreen() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            //margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: MyCardWidget(),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          child: Image.asset(
            'assets/images/login.png',
            height: _height / 3.5,
            width: _width / 3.5,
          ),
        ),
      ],
    );
  }
}
