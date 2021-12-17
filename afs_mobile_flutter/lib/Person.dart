//import 'package:flutter/cupertino.dart';

class Person {
  String name;
  String title;
  String reqAmount;
  String collectAmount;
  String status;
  String deadline;
  String profileImg;

  Person(
      {required this.name,
      required this.title,
      required this.profileImg,
      required this.reqAmount,
      required this.collectAmount,
      required this.status,
      required this.deadline});
}
