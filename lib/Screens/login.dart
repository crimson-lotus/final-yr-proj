// import 'package:final_yr_project/Screens/register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../components/background.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late final TextEditingController _email;
//   late final TextEditingController _password;

//   @override
//   void initState() {
//     _email = TextEditingController();
//     _password = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _email.dispose();
//     _password.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Background(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               child: Text(
//                 "LOGIN",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF2661FA),
//                     fontSize: 36),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             SizedBox(height: size.height * 0.03),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(horizontal: 40),
//               child: TextField(
//                 controller: _email,
//                 decoration: InputDecoration(labelText: "Username"),
//               ),
//             ),
//             SizedBox(height: size.height * 0.03),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(horizontal: 40),
//               child: TextField(
//                 controller: _password,
//                 decoration: InputDecoration(labelText: "Password"),
//                 obscureText: true,
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: Text(
//                 "Forgot your password?",
//                 style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
//               ),
//             ),
//             SizedBox(height: size.height * 0.05),
//             Container(
//               alignment: Alignment.centerRight,
//               margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: RaisedButton(
//                 onPressed: () {
//                   signIn();
//                 },
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(80.0)),
//                 textColor: Colors.white,
//                 padding: const EdgeInsets.all(0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 50.0,
//                   width: size.width * 0.5,
//                   decoration: new BoxDecoration(
//                       borderRadius: BorderRadius.circular(80.0),
//                       gradient: new LinearGradient(colors: [
//                         Color.fromARGB(255, 255, 136, 34),
//                         Color.fromARGB(255, 255, 177, 41)
//                       ])),
//                   padding: const EdgeInsets.all(0),
//                   child: Text(
//                     "LOGIN",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: GestureDetector(
//                 onTap: () => {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => RegisterScreen()))
//                 },
//                 child: Text(
//                   "Don't Have an Account? Sign up",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF2661FA)),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future signIn() async {
//     final email = _email.text;
//     final password = _password.text;
//     await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//   }
// }
