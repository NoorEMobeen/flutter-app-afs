import 'package:flutter/material.dart';

class EditProfileIcon extends StatefulWidget {
  @override
  _EditIconState createState() => _EditIconState();
}

// ignore: camel_case_types
class _EditIconState extends State<EditProfileIcon> {
  set _status(bool _status) {}

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
