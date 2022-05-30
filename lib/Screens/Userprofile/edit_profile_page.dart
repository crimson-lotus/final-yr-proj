import 'package:final_yr_project/Screens/Userprofile/widgets/profile_widget.dart';
import 'package:final_yr_project/Screens/Userprofile/widgets/text_field_widget.dart';
import 'package:final_yr_project/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;

  @override
  void initState() {
    _name = TextEditingController(text: user?.displayName);
    _email = TextEditingController(text: user?.email);
    _phone = TextEditingController(text: user?.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text("Edit User Profile",
            style: TextStyle(
              color: Colors.black54,
            )),
        leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black54),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/profilepage/', (route) => false);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user?.photoURL as String,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 12),
          TextFieldWidget(
            label: 'Name',
            text: user?.displayName as String,
            onChanged: (name) {},
            controller: _name,
          ),
          const SizedBox(height: 12),
          TextFieldWidget(
            label: 'Email ID',
            text: user?.email as String,
            onChanged: (email) {},
            controller: _email,
          ),
          const SizedBox(height: 12),
          // TextFieldWidget(
          //   label: 'Phone Num',
          //   text: user?.phoneNumber as String,
          //   onChanged: (about) {},
          //   controller: _phone,
          // ),
          const SizedBox(height: 9),
          RoundedButton(
            color: Colors.blue.shade300,
            text: "Update",
            press: () {
              update();
            },
          )
        ],
      ),
    );
  }

  Future update() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await user?.updateDisplayName(_name.text.trim());
      await user?.updateEmail(_email.text.trim());
      print(_email.text.trim());
      // await user?.updatePhoneNumber(_phone.text.trim() as PhoneAuthCredential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/profilepage/', (route) => false);
  }
}
