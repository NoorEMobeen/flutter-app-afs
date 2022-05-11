import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _getActionState createState() => _getActionState();
}

// ignore: camel_case_types
class _getActionState extends State<EditProfile> {
  // ignore: unused_field
  bool _status = true;
  @override
  Widget build(BuildContext context) {

    showAlertDialog() {
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        }
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Data"),
        content: Text("Your Data has been Saved."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  // ignore: deprecated_member_use
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  showAlertDialog();
                  setState(() {
                    _status = false;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  // ignore: deprecated_member_use
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () => Navigator.pop(context, false),
                  // setState(() {
                  //   _status = false;
                  //   FocusScope.of(context).requestFocus(new FocusNode());
                  // });
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  // Widget _getActionButtons() {
  //     return Padding(
  //       padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
  //       child: new Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: <Widget>[
  //           Expanded(
  //             child: Padding(
  //               padding: EdgeInsets.only(right: 10.0),
  //               child: Container(
  //                   // ignore: deprecated_member_use
  //                   child: new RaisedButton(
  //                 child: new Text("Save"),
  //                 textColor: Colors.white,
  //                 color: Colors.green,
  //                 onPressed: () {
  //                   // setState(() {
  //                   //   _status = true;
  //                   //   FocusScope.of(context).requestFocus(new FocusNode());
  //                   // });
  //                 },
  //                 shape: new RoundedRectangleBorder(
  //                     borderRadius: new BorderRadius.circular(20.0)),
  //               )),
  //             ),
  //             flex: 2,
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: EdgeInsets.only(left: 10.0),
  //               child: Container(
  //                   // ignore: deprecated_member_use
  //                   child: new RaisedButton(
  //                 child: new Text("Cancel"),
  //                 textColor: Colors.white,
  //                 color: Colors.red,
  //                 onPressed: () {
  //                   //   setState(() {
  //                   //   //   _status = true;
  //                   //   //   FocusScope.of(context).requestFocus(new FocusNode());
  //                   //   // });
  //                 },
  //                 shape: new RoundedRectangleBorder(
  //                     borderRadius: new BorderRadius.circular(20.0)),
  //               )),
  //             ),
  //             flex: 2,
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _getEditIcon() {
  //     return new GestureDetector(
  //       child: new CircleAvatar(
  //         backgroundColor: Colors.red,
  //         radius: 14.0,
  //         child: new Icon(
  //           Icons.edit,
  //           color: Colors.white,
  //           size: 16.0,
  //         ),
  //       ),
  //       onTap: () {
  //         setState(() {
  //           _status = false;
  //         });
  //       },
  //     );
  //   }
}
