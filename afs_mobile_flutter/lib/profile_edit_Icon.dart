import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EditProfileIcon extends StatefulWidget {
  @override
  _EditIconState createState() => _EditIconState();
}

// ignore: camel_case_types
class _EditIconState extends State<EditProfileIcon> {
  // ignore: unused_field
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = true;
        });
      },
    );
  }
}
