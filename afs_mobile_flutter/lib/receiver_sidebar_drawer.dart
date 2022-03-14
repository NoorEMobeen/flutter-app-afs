import 'package:afs_mobile_flutter/Transaction.dart';
import 'package:afs_mobile_flutter/UserProfile.dart';
import 'package:afs_mobile_flutter/dashboard_Receiver.dart';
import 'package:afs_mobile_flutter/requestForm.dart';
import 'package:afs_mobile_flutter/student_form.dart';
import 'package:afs_mobile_flutter/ui/signin.dart';
import 'package:afs_mobile_flutter/receiver_account';
import 'package:flutter/material.dart';

class CustomSidebarDrawer extends StatefulWidget {
  final Function drawerClose;

  CustomSidebarDrawer(
      {
      //Key? key,
      required this.drawerClose});
//      : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  _CustomSidebarDrawerState createState() => _CustomSidebarDrawerState();
}

class _CustomSidebarDrawerState extends State<CustomSidebarDrawer> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/as.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Automated Fundraising System")
                ],
              )),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardReceiver()),
              );
            },
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard Receiever"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            leading: Icon(Icons.person),
            title: Text(
              "User Profile",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestForm()),
              );
            },
            leading: Icon(Icons.request_page),
            title: Text("Create Request"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            leading: Icon(Icons.history),
            title: Text("History & Transaction"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentForm()),
              );
            },
            leading: Icon(Icons.info),
            title: Text("Student Form"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReceiverAccounts()),
              );
            },
            leading: Icon(Icons.account_box),
            title: Text("Accounts"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
            leading: Icon(Icons.logout),
            title: Text("Log out"),
          ),
        ],
      ),
    );
  }
}
