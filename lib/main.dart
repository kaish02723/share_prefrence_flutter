import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_prefrence_flutter/ProviderController/login_provider.dart';
import 'package:share_prefrence_flutter/ProviderController/signup_provider.dart';
import 'package:share_prefrence_flutter/ProviderController/theme_mode_provider.dart';
import 'package:share_prefrence_flutter/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SignupProvider>(create: (context) => SignupProvider(),),
    ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider(),),
    ChangeNotifierProvider<ThemeChangeProvider>(create: (context) => ThemeChangeProvider(),),
  ],child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var _providerThemeManage = Provider.of<ThemeChangeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _providerThemeManage.currentTheme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
