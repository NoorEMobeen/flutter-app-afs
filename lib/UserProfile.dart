//import 'package:afs_mobile_flutter/custom_sidebar_drawer.dart';

import 'dart:io';

import 'package:afs_mobile_flutter/receiver_sidebar_drawer.dart';
import 'package:afs_mobile_flutter/ui/widgets/custom_shape.dart';
//import 'package:afs_mobile_flutter/ui/widgets/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/profile_methods.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  FSBStatus? _fsbStatus;
  // bool _enabled = false;
  //FSBStatus? _fsbStatus;
  final FocusNode myFocusNode = FocusNode();

  void initState() {
    super.initState();
  }

// // Get from gallery
// _getFromGallery() async {
//     PickedFile pickedFile = await ImagePicker().getImage(
//         source: ImageSource.gallery,
//         maxWidth: 1800,
//         maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
//     }
// }

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
        title: Text('User Profile'),

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
        screenContents: ProfilePage(),
        status: _fsbStatus,
      ),
    );
  }

  void dispose() {
    // Clean up the controller when the Widget is disposed
    var myFocusNode;
    myFocusNode.dispose();
    super.dispose();
  }
}

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

// ignore: must_be_immutable
class ProfilePageState extends State<ProfilePage> {
  bool _status = false;
  bool imgflag = false;
  var _image;
  final _picker = ImagePicker();
  //Implementing the image picker
  Future<void> _openImagePicker() async {
    // print('Image here: $_image');
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print('Comming here: ${pickedImage.path}');
      setState(() {
        imgflag = true;
        _image = Image.memory(File(pickedImage.path).readAsBytesSync()).image;
      });
      print('Image here: $_image, $imgflag');
    }
  }

  @override
  Widget build(BuildContext context) {
    //FSBStatus? _fsbStatus;
    return Container(
      child: Scaffold(
          body: new Container(
        // color: Colors.white,
        child: new ListView(
          children: <Widget>[
            // clipShape(),
            Column(
              children: <Widget>[
                new Container(
                  // decoration: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //       // begin: Alignment.topLeft,
                  //       //  end: Alignment.bottomRight,
                  //       colors: [Colors.white10, Colors.pinkAccent]
                  //       ),
                  // ),

                  height: 250.0,
                  color: Colors.white12,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child:
                            new Stack(fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                width: 140.0,
                                height: 200.0,
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 0.0,
                                        color: Colors.black26,
                                        offset: Offset(1.0, 10.0),
                                        blurRadius: 20.0),
                                  ],
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: !imgflag ? new ExactAssetImage(
                                        'assets/images/as.png'):_image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      _openImagePicker();
                                      print('Adding photo');
                                    },
                                    // child: Icon(
                                    //   Icons.add_a_photo,
                                    //  // size: _large ? 40 : (_medium ? 33 : 31),
                                    //   color: Colors.orange[200],
                                    // )
                                   ),
                              ),
                            ],
                          ),
                          // Padding(
                          //     padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          //     child: new Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: <Widget>[
                          //         new CircleAvatar(
                          //           backgroundColor: Colors.red,
                          //           radius: 25.0,
                          //           child: new Icon(
                          //             Icons.camera_alt,
                          //             color: Colors.white,
                          //           ),
                          //         )
                          //       ],
                          //     )),
                        ]),
                      )
                    ],
                  ),
                ),

                new Container(
                  // color: Color(0xffFFFFFF),
                  // decoration: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //       // begin: Alignment.topLeft,
                  //       //  end: Alignment.bottomRight,
                  //       colors: [Colors.white10, Colors.pinkAccent]),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0, top: 50.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Personal Information',
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      // new GestureDetector(
                                      //   child: new CircleAvatar(
                                      //     backgroundColor: Colors.red,
                                      //     radius: 14.0,
                                      //     child: new Icon(
                                      //       Icons.edit,
                                      //       color: Colors.white,
                                      //       size: 16.0,
                                      //     ),
                                      //   ),
                                      //   onTap: () {
                                      //     setState(() {
                                      //       _status = true;
                                      //     });
                                      //   },
                                      // )
                                    ])
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 45.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    decoration: const InputDecoration(
                                      hintText: "Enter Your Name",
                                    ),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Website',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Website"),
                                    enabled: !_status,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Mobile',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Mobile Number"),
                                    enabled: !_status,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Family members',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    child: new Text(
                                      'Earnings',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter family members"),
                                      enabled: !_status,
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: new TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter per/month earning"),
                                    enabled: !_status,
                                  ),
                                  flex: 2,
                                ),
                              ],
                            )),
                        !_status ? EditProfile() : new Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }

  //setState(Null Function() param0) {}
}

Widget clipShape() {
  //double height = MediaQuery.of(context).size.height;
  var _height;
  var _width;
  var _large;
  var _medium;
  return Stack(
    children: <Widget>[
      Opacity(
        opacity: 0.75,
        child: ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: _large
                ? _height / 4
                : (_medium ? _height / 3.75 : _height / 3.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.pinkAccent],
              ),
            ),
          ),
        ),
      ),
      Opacity(
        opacity: 0.5,
        child: ClipPath(
          clipper: CustomShapeClipper2(),
          child: Container(
            height: _large
                ? _height / 4.5
                : (_medium ? _height / 4.25 : _height / 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.pinkAccent],
              ),
            ),
          ),
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(
            top: _large
                ? _height / 30
                : (_medium ? _height / 25 : _height / 20)),
        child: Image.asset(
          'assets/images/login.png',
          height: _height / 3.5,
          width: _width / 3.5,
        ),
      ),
    ],
  );
}
