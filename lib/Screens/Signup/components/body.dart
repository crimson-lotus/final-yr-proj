import 'package:final_yr_project/Screens/Signup/components/background.dart';
import 'package:final_yr_project/components/already_have_an_account_acheck.dart';
import 'package:final_yr_project/components/rounded_button.dart';
import 'package:final_yr_project/components/rounded_input_field.dart';
import 'package:final_yr_project/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:email_validator/email_validator.dart';
import '../../../constants.dart';
import 'dart:math';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _emailCheck = false;
  bool _passwordCheck = false;

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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                  hintText: "Your Email",
                  controller: _emailController,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value != null && !EmailValidator.validate(value)) {
                      _emailCheck = false;
                      return 'Enter proper email Id';
                    }
                    _emailCheck = true;
                    return null;
                  }),
              RoundedPasswordField(
                  controller: _passwordController,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value != null && value.length < 6) {
                      _passwordCheck = false;
                      return 'Enter minimum 6 characters';
                    }
                    _passwordCheck = true;
                    return null;
                  }),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  signUp();
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    if (!(_emailCheck && _passwordCheck)) return;
    final random = Random();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      final user = FirebaseAuth.instance.currentUser;
      var index = random.nextInt(pfpLinks.length);
      await user?.updateDisplayName(pfpLinks[index][1]);
      await user?.updatePhotoURL(pfpLinks[index][0]);
      print(user);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/homescreen/', (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
