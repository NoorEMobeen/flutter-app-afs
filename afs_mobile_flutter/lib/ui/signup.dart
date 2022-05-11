import 'dart:io';
import 'package:afs_mobile_flutter/ui/signin.dart';
import 'package:flutter/material.dart';
import 'package:afs_mobile_flutter/constants/constants.dart';
import 'package:afs_mobile_flutter/ui/widgets/custom_shape.dart';
import 'package:afs_mobile_flutter/ui/widgets/customappbar.dart';
import 'package:afs_mobile_flutter/ui/widgets/responsive_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<DropdownMenuItem<String>> get dropdownRoles {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Student"), value: "Student"),
      DropdownMenuItem(child: Text("Donor"), value: "Donor"),
    ];
    return menuItems;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  late String email, password;
  var items = [
    'Student',
    'Donor',
  ];


  late bool checkBoxValue;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;

  late bool newValue;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                // acceptTermsTextRow(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // late File _image;
  // final _picker = ImagePicker();
  // // Implementing the image picker
  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  late File imageFile;
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 180,
      maxHeight: 180,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
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
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //   RaisedButton(
          //     color: Colors.greenAccent,
          //     onPressed: (){
          //         _openImagePicker();
          //       },
          //     child: Icon(
          //         Icons.add_a_photo,
          //         size: _large ? 40 : (_medium ? 33 : 31),
          //         color: Colors.orange[200],
          //       ),
          //     ),
          //   ],
          // ),
          child: GestureDetector(
              onTap: () {
                _getFromGallery();
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 31),
                color: Colors.orange[200],
              )),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            roleTextFormField(),
            SizedBox(height: _height / 60.0),
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }
  String dropdownvalue = "Student";
  Widget roleTextFormField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownvalue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
            // icon: Icon(Icons.keyboard_arrow_down),
            // items: items.map((String items) {
            //   return DropdownMenuItem(value: items, child: Text(items));
            // }).toList(), onChanged: (String? value) {  },
            // onChanged: (String newValue) {
            //   setState(() {
            //     dropdownvalue = newValue;
            //   });
            // },
            hint: Text("Enter Role"),
            items: dropdownRoles
          ),
        ],
      ),
    );
  }

  Widget firstNameTextFormField() {
    return Container(
        child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: "First Name",
      ),
    ));
  }

  Widget lastNameTextFormField() {
    return Container(
        child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: "Last Name",
      ),
    ));
  }

  Widget emailTextFormField() {
    return Container(
        child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        email = value; // get value from TextField
      },
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: "Email ID",
      ),
    ));
  }

  Widget phoneTextFormField() {
    return Container(
        child: TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.phone),
        hintText: "Mobile Number",
      ),
    ));
  }

  Widget passwordTextFormField() {
    return Container(
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          password = value; //get value from textField
        },
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: "Password",
        ),
      ),
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (value) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    // ignore: deprecated_member_use
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        signUp(email: email, password: password).then((result) {
          if (result == null) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          } else {
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                result,
                style: TextStyle(fontSize: 16),
              ),
            ));
          }
        });
        print("Routing to your account");
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange, Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'SIGN UP',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(signIn);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
