import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'History_Page.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => new _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  @override
  Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: Text('New Request'),
      actions: [
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
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Text(
                'Fill Form Below',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 60, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Rs/-',
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.today),
            title: const Text('Deadline'),
            subtitle: const Text('November 18, 2021'),
            //trailing: const Icon(Icons.check_circle, color: Colors.green,),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 20, bottom: 0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 70),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(top: 60),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text(
                'Request',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
