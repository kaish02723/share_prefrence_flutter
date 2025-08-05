import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_prefrence_flutter/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider with ChangeNotifier{
  var validationKey = GlobalKey<FormState>();
  bool passordVisibal = true;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  clickUpdateButton(BuildContext context) async {
    if (validationKey.currentState!.validate()) {
      var sharePrefrence =
          await SharedPreferences.getInstance();
      sharePrefrence.setString(
          "Name", nameController.text.toString());
      sharePrefrence.setString(
          "Email", emailController.text.toString());
      sharePrefrence.setString("Password",
          passwordController.text.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
        content: Text('SignUp successful'),
        showCloseIcon: true,
      ));
    }
  }

  passwordHideVisible(){
    passordVisibal = !passordVisibal;
  }

}