import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/donor_sidebar_drawer.dart';
//import 'pay.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';

class DonorAccounts extends StatefulWidget {
  @override
  DonorAccountsState createState() => DonorAccountsState();
}

class DonorAccountsState extends State<DonorAccounts> {
  FSBStatus? _fsbStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Profile'),
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
        screenContents: null,
        status: _fsbStatus,
      ),
    );
  }
}

class AccountsTab extends StatefulWidget {
  @override
  AccountsTabWidget createState() => AccountsTabWidget();
}

class AccountsTabWidget extends State {
  String paymentID = "";
  String orderId = "";
  String transaction = "";

  final _teAmount = TextEditingController();
  final _teEmail = TextEditingController();

  // void _pay() {
  //   if (_teAmount.text.isNotEmpty && _teEmail.text.isNotEmpty) {
  //     final result = Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => Pay(
  //                 _teAmount.text.trim(),
  //                 _teEmail.text.trim(),
  //                 "E4B73FEE-F492-4607-A38D-852B0EBC91C9", title: '',)));
  //     result.then((result) {
  //       transactionResult(result);
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: getFormUI(),
      ),
    ));
  }

  Widget getFormUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: _teAmount,
          decoration: InputDecoration(hintText: 'Amount'),
          keyboardType: TextInputType.phone,
          maxLength: 10,
        ),
        TextFormField(
          controller: _teEmail,
          decoration: InputDecoration(hintText: 'Email'),
          maxLength: 32,
        ),
        SizedBox(height: 15.0),
        // ignore: deprecated_member_use
        // RaisedButton(
        // //  onPressed: _pay,
        //   child: Text('Pay'),
        // ),
        SizedBox(height: 40.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(paymentID),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(orderId),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(transaction),
        ),
      ],
    );
  }

  Widget buttonMedium(String buttonLabel, EdgeInsets margin, Color bgColor,
      Color textColor, double textSize) {
    var loginBtn = Container(
      margin: margin,
      padding: EdgeInsets.all(10.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(const Radius.circular(60.0)),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
            color: textColor, fontSize: textSize, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  void transactionResult(String result) {
    _teAmount.text = "";
    _teEmail.text = "";

    setState(() {
      var transactionDetail = result.split(" ");

      paymentID = "Payment Id: " + transactionDetail[0];
      orderId = "OrderId: " + transactionDetail[1];
      transaction = "Transaction Id: " + transactionDetail[2];
    });
  }
}
