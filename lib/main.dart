import 'package:final_yr_project/Screens/Login/login_screen.dart';
import 'package:final_yr_project/Screens/Signup/signup_screen.dart';
import 'package:final_yr_project/Screens/Userprofile/profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/Courses/courseContent.dart';
import 'Screens/Homepage/category_screen.dart';
import 'Screens/Homepage/home_screen.dart';
import 'Screens/Quiz/quiz_screen.dart';
import 'Screens/Userprofile/edit_profile_page.dart';
// import 'Screens/home_page.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Learning App',
    theme: ThemeData(
      primaryColor: Color(0xFF2661FA),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyApp(),
    routes: {
      '/login/': (context) => const LoginScreen(),
      '/register/': (context) => const SignUpScreen(),
      // '/homepage/': (context) => const HomePage(),
      '/homescreen/': (context) => const HomeScreen(),
      '/courses/': (context) => const CategoryScreen(),
      '/profilepage/': (context) => const ProfilePage(),
      '/editprofilepage/': (context) => const EditProfilePage(),
      '/coursecontent/': (context) => const CourseContent(),
      '/quiz/': (context) => const QuizScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              print(user);
              if (user != null) {
                // return const HomePage();
                return const HomeScreen();
              } else {
                return const LoginScreen();
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
