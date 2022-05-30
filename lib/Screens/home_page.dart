import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import '../components/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Signed in as',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                user?.email as String,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
