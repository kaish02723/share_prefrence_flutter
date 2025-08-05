import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_prefrence_flutter/login_provider.dart';
import 'package:share_prefrence_flutter/signup_provider.dart';
import 'package:share_prefrence_flutter/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<SignupProvider>(create: (context) => SignupProvider(),),
      ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),);
  }
}
