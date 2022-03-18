// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    required this.requestTitle,
    required this.requestAmount,
    required this.deadlineDay,
    required this.deadlineTime,
    required this.reasonDetail,
  });

  String requestTitle;
  String requestAmount;
  String deadlineDay;
  String deadlineTime;
  String reasonDetail;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    requestTitle: json["RequestTitle"],
    requestAmount: json["RequestAmount"],
    deadlineDay: json["DeadlineDay"],
    deadlineTime: json["DeadlineTime"],
    reasonDetail: json["ReasonDetail"],
    );

  Map<String, dynamic> toJson() => {
    "RequestTitle": requestTitle,
    "RequestAmount": requestAmount,
    "DeadlineDay": deadlineDay,
    "DeadlineTime": deadlineTime,
    "ReasonDetail": reasonDetail,
  };
}
