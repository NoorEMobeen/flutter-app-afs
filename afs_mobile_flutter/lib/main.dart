import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:afs_mobile_flutter/constants/constants.dart';
import 'package:afs_mobile_flutter/ui/signin.dart';
import 'package:afs_mobile_flutter/ui/signup.dart';
import 'package:afs_mobile_flutter/ui/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().whenComplete(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: Colors.orange[200]),
      routes: <String, WidgetBuilder>{
        splashScreen: (BuildContext context) => SplashScreen(),
        signIn: (BuildContext context) => SignInPage(),
        signUp: (BuildContext context) => SignUpScreen(),
      },
      initialRoute: splashScreen,
    );
  }
}
