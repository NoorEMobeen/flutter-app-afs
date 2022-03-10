// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:afs_mobile_flutter/ProgressHud.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// // ignore: must_be_immutable
// class Pay extends StatefulWidget {

//   final String title;
//   String packagePrice;
//   String userEmail;
//   String fatoraKey;

//   Pay(this.packagePrice,  this.userEmail, this.fatoraKey, {Key? key, required this.title})
//       : super(key: key);

//   @override
//   _PayState createState() => _PayState(packagePrice,userEmail,fatoraKey);
// }

// class _PayState extends State<Pay> {
//   String packagePrice;
//   String userEmail;
//   String fatoraKey;
//  _PayState(this.packagePrice, this.userEmail,this.fatoraKey);

//   bool _isLoading = true;
//   WebViewController controller;
//   static var uri = "https://maktapp.credit/v3/";
//   String baseURl = "https://maktapp.credit";

//   static BaseOptions options = BaseOptions(
//       baseUrl: uri,
//       responseType: ResponseType.plain,
//       connectTimeout: 30000,
//       receiveTimeout: 30000,
//       validateStatus: (code) {
//         if (code! >= 200) {
//           return true;
//         } else {
//           return false;
//         }
//       });

//   static Dio dio = Dio(options);



//   @override
//   void initState() {
//     super.initState();
//     getFatoraUrl();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//           title: Text("Fatora Payment Gateway",style: TextStyle(color:Colors.white),),
//         ),
//         body: ProgressHUD(
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Stack(
//               children: <Widget>[
//                 WebView(
//                     initialUrl: baseURl,
//                     javascriptMode: JavascriptMode.unrestricted,
//                     onPageFinished: pageFinishedLoading,
//                     onWebViewCreated: (WebViewController webViewController) {
//                       controller = webViewController;
//                     }),
//               ],
//             ),
//           ),
//           inAsyncCall: _isLoading,
//           opacity: 0.0, valueColor: null,
//         ),

//     );
//   }

//   void pageFinishedLoading(String url) {
//     setState(() {
//       _isLoading = false;
//       if (url.contains("SuccessPayment")) {

//         var transactionResponse = url.split('paymentID=')[1].split("&orderId=");
//         var paymentID = transactionResponse[0];
//         var orderId = transactionResponse[1].split("&transactionid=")[0];
//         var transactionId = transactionResponse[1].split("&transactionid=")[1];
//         Navigator.pop(context, paymentID+" "+orderId+" "+transactionId);

//       } else if (url.contains("Declined")) {
//         setState(() {
//           baseURl = url;
//           controller.loadUrl(baseURl);
//           _isLoading = true;
//         });
//       }
//     });
//   }

//   Future<dynamic> getFatoraUrl() async {
//     try {
//       var response = await dio.post('AddTransaction', data: {
//         "token": fatoraKey,
//         "orderId": Uuid().v1(),
//         "amount": packagePrice,
//         "customerEmail": userEmail,
//         "lang": "en"
//       });
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var responseJson = json.decode(response.data);

//         setState(() {
//           baseURl = responseJson["result"];
//           controller.loadUrl(baseURl);
//           _isLoading = true;
//         });

//         return responseJson;
//       } else
//         print(">>Error: " + response.statusCode.toString());
//     } on DioError catch (exception) {
//       if (exception == null ||
//           exception.toString().contains('SocketException')) {
//         print(">>Error: " + "Network Error");
//       } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
//           exception.type == DioErrorType.CONNECT_TIMEOUT) {
//         print(">>Error: " +
//             "Could'nt connect, please ensure you have a stable network.");
//       } else {
//         return null;
//       }
//     }
//   }
// }
