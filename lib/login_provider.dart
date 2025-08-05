import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_prefrence_flutter/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier{
  var validationKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  clickButtonUpdate(BuildContext context) async {
    if (validationKey.currentState!.validate()) {
      var sharePrefrence =
          await SharedPreferences.getInstance();
      var signupEmailGet =
      sharePrefrence.getString("Email");
      var signupPasswordGet = sharePrefrence.getString("Password");

      if(emailController.text==signupEmailGet && passwordController.text==signupPasswordGet){
        sharePrefrence.setBool("login_status", true);
      }
      else if (emailController.text.toString()!=signupEmailGet) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
          content: Text('Wrong email!'),
          showCloseIcon: true,
        ));
      } else if (passwordController.text.toString() !=signupPasswordGet) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
          content: Text('Wrong password!'),
          showCloseIcon: true,
        ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(),
            ));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
          content: Text('Login successful!'),
          showCloseIcon: true,
        ));
      }
    }
  }


  passwordHideVisible(){
    passwordVisible = !passwordVisible;
  }
}