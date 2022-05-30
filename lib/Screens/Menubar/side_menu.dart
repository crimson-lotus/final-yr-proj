import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Homepage/components/utils/const.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )),
    );
  }
}

Widget buildHeader(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  return Material(
    color: Colors.deepPurple.shade200,
    child: InkWell(
      onTap: () {
        Navigator.pop(context);

        Navigator.of(context).pushNamed('/profilepage/');
      },
      child: Container(
          padding: EdgeInsets.only(
            top: 21 + MediaQuery.of(context).padding.top,
            bottom: 21,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  user?.photoURL as String,
                ),
              ),
              SizedBox(height: 12),
              Text(
                user?.displayName as String,
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
              Text(
                user?.email as String,
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          )),
    ),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(12),
    child: Wrap(
      runSpacing: 9,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Home"),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/homescreen/', (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.portrait_outlined),
          title: const Text("Profile"),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/profilepage/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.play_circle),
          title: const Text("Courses"),
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/courses/', (route) => false);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text("Logout"),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login/', (route) => false);
          },
        ),
        SizedBox(height: Constants.mainPadding * 3),
        const Divider(color: Colors.black54),
        // SizedBox(height: Constants.mainPadding * 3),
        ListTile(
          leading: const Icon(Icons.close_outlined),
          title: const Text("Close"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
