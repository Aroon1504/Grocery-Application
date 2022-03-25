//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/auth/login.dart';
import 'package:grocery/auth/signup.dart';
import 'package:grocery/page/home.dart';
import 'package:grocery/page/splash.dart';
import 'package:grocery/provider/app.dart';
import 'package:grocery/provider/product.dart';
import 'package:grocery/provider/user_provider.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.intialize()),
      ChangeNotifierProvider.value(value: AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.black,
        brightness: Brightness.light,
        primaryColor: Colors.black,
      ),
      home: ScreenController(),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return const Splash();
      case Status.Unauthenticated:
        return Login();
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      case Status.SignUp:
        return SignUp();
      case Status.home:
        return HomePage();
      default:
        return Login();
    }
  }
}
