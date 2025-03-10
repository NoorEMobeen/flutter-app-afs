// ignore_for_file: non_constant_identifier_names, duplicate_ignore, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
//import 'Transaction.dart';
import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
//import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => new _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  FSBStatus? _fsbStatus;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => setState(() {
            _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
                ? FSBStatus.FSB_CLOSE
                : FSBStatus.FSB_OPEN;
          }),
        ),

        // leading: Icon(Icons.menu),
        title: Text('Fund Request'),
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
        screenContents: Form(),
        status: _fsbStatus,
      ),
    );
  }
}

Future<void> fire(String ReTitle, String ReAmount, String DeadDay,
    String DeadTime, String ReDetail) async {
  CollectionReference users = FirebaseFirestore.instance.collection('requests');
  // ignore: unused_local_variable
  FirebaseAuth auth = FirebaseAuth.instance;
  users.add({
    'RequestTitle': ReTitle,
    'RequestAmount': ReAmount,
    'DeadlineDay': DeadDay,
    'DeadlineTime': DeadTime,
    'ReasonDetail': ReDetail
  });
  return;
}

// Future<Album> createAlbum(String ReTitle, String ReAmount, String DeadDay,String DeadTime, String ReDetail) async {
//
//   var currentTok = await FirebaseAuth.instance.currentUser?.getIdToken();
//
//   final String url = 'http://10.102.140.118:5000/student/create/request';
//   print("Body Data ReTitle: "+ReTitle);
//   final response = await http.post(Uri.parse(url),
//       headers:{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'authorization': currentTok!,
//       },
//       body:jsonEncode(<String, String>{
//         'RequestTitle':   ReTitle,
//         'RequestAmount':  ReAmount,
//         'DeadlineDay':    DeadDay,
//         'DeadlineTime':   DeadTime,
//         'ReasonDetail':   ReDetail,
//         }),
//       );
//   print("Body Data: "+response.body);
//   //print("Post Token: "+ currentTok!);
//
//   if (response.statusCode == 200) {
//     print("IF Data: "+response.body);
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     print("Else Data: "+response.body);
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }
// class Album {
//   final String requestTitle;
//   final String requestAmount;
//   final String deadlineDay;
//   final String deadlineTime;
//   final String reasonDetail;
//
//   const Album({required this.requestTitle, required this.requestAmount,required this.deadlineDay, required this.deadlineTime,required this.reasonDetail});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       requestTitle:   json['RequestTitle'],
//       requestAmount:  json['RequestAmount'],
//       deadlineDay:    json['DeadlineDay'],
//       deadlineTime:   json['DeadlineTime'],
//       reasonDetail:   json['ReasonDetail'],
//     );
//   }
// }

//Second Class for Form Submission
class Form extends StatefulWidget {
  @override
  _Form createState() => new _Form();
}

class _Form extends State<Form> {
  TextEditingController RequestTitle = TextEditingController();
  TextEditingController RequestAmount = TextEditingController();
  TextEditingController DeadlineDay = TextEditingController();
  TextEditingController DeadlineTime = TextEditingController();
  TextEditingController ReasonDetail = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Text(
                  'Funds Request',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  //color: Colors.blue,
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: TextFormField(
                    controller: RequestTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  // color: Colors.blue,
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 10),
                  child: TextFormField(
                    controller: RequestAmount,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Requested amount',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 15.0, top: 20),
              child: Center(
                child: TextField(
                  controller: DeadlineDay,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, //context of current state
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16

                      setState(() {
                        DeadlineDay.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 15.0, top: 20),
              child: Center(
                child: TextField(
                  controller: DeadlineTime,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Time" //label text of field
                      ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context, //context of current state
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        DeadlineTime.text =
                            formattedTime; //set the value of text field.
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                  child: TextFormField(
                    controller: ReasonDetail,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a Message Here',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 170,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.pinkAccent],
                  ),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(top: 50),
              // ignore: deprecated_member_use

              child: FlatButton(
                // onPressed: () {
                //   final String title = RequestTitle.text;
                //   final String amount = RequestAmount.text;
                //   final String day = DeadlineDay.text;
                //   final String time = DeadlineTime.text;
                //   final String reason = ReasonDetail.text;
                //
                //   //final Album data = await createAlbum(title,amount, day, time, reason);
                //
                //    print("Title Data: "+ '${RequestTitle.text}');
                //     print("Amount Data: "+ '${RequestAmount.text}');
                //     print("Reason Data: "+ '${DeadlineDay.text}');
                //
                //     Map<String,dynamic> data = {
                //       "RequestTitle": RequestTitle.text,
                //       "RequestAmount": RequestAmount.text,
                //       "Reasondetail": ReasonDetail.text,
                //
                //   },
                //    setState(() {
                //      print("saffar khan in setState");
                //      //getUserData(title,amount, day, time, reason);
                //     // _futureAlbum = data as Future<Album>?;
                //    });
                //   Navigator.push(
                //       context, MaterialPageRoute(builder: (_) => HomePage()));
                // },

                onPressed: () {
                  fire(RequestTitle.text, RequestAmount.text, DeadlineDay.text,
                      DeadlineTime.text, ReasonDetail.text);
                  AlertDialog alert = AlertDialog(
                    title: Text("Note"),
                    content: Text("Your Request has been Received"),
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: Text(
                  'Request',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
