import 'package:afs_mobile_flutter/dashboard_donor.dart';
//import 'package:afs_mobile_flutter/donor_accounts.dart';

import 'package:afs_mobile_flutter/ui/donorProfile.dart';
import 'package:afs_mobile_flutter/ui/signin.dart';
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
      child: SingleChildScrollView(
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
                  MaterialPageRoute(builder: (context) => DashboardDonor()),
                );
              },
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonorProfile()),
                );
              },
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => DonorAccounts()),
            //     );
            //   },
            //   leading: Icon(Icons.account_box),
            //   title: Text(
            //     "Donate",
            //   ),
            // ),
            // Divider(
            //   height: 1,
            //   color: Colors.grey,
            // ),
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
      ),
    );
  }
}
