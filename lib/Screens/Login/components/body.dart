import 'package:final_yr_project/Screens/Login/components/background.dart';
import 'package:final_yr_project/Screens/Signup/signup_screen.dart';
import 'package:final_yr_project/components/already_have_an_account_acheck.dart';
import 'package:final_yr_project/components/rounded_button.dart';
import 'package:final_yr_project/components/rounded_input_field.dart';
import 'package:final_yr_project/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: _emailController,
              onChanged: (value) {
                // print(value);
                // print(_emailController.text);
              },
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {
                // print(_passwordController.text);
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                signIn();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/homescreen/', (value) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // devtools.log("User is not registered");
        await showErrorDialog(
          context,
          'User Not Found',
        );
      } else if (e.code == 'wrong-password') {
        // devtools.log("Entered wrong password");
        await showErrorDialog(
          context,
          'Wrong credentials',
        );
      } else {
        // devtools.log("Enter login details");
        await showErrorDialog(
          context,
          'Error: ${e.code}',
        );
      }
      // print(e.code);
    } catch (e) {
      await showErrorDialog(
        context,
        e.toString(),
      );
    }
  }
}

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('An error occured!'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          )
        ],
      );
    },
  );
}
