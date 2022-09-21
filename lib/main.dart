import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/login_screen/login_screen.dart';
import 'package:moma/login_screen/reset_password.dart';
import 'package:moma/login_screen/sign_up.dart';
import 'package:moma/main_app_screen/main_screen.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

void main() async{
  MomaUser appUser = MomaUser("test@gmail.com");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(appUser: appUser,));
}

class MyApp extends StatelessWidget {
  late MomaUser appUser;

  MyApp({Key? key,required this.appUser}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOMA',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: primaryBlack,
      ),
      home: LoginPage(appUser: appUser),
      //home: MainScreen(appUser: appUser,),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignupPage(),
        '/reset_password': (BuildContext context) => ResetPassword(),
        '/main_screen': (BuildContext context) => MainScreen(appUser: appUser ,),
      },
    );
  }
}

