import 'package:final_yr_project/Screens/Userprofile/widgets/profile_widget.dart';
import 'package:final_yr_project/Screens/Userprofile/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text("User Profile",
            style: TextStyle(
              color: Colors.black54,
            )),
        leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black54),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/homescreen/', (route) => false);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 6),
          ProfileWidget(
            imagePath: user?.photoURL as String,
            onClicked: () {
              Navigator.of(context).pushNamed('/editprofilepage/');
            },
          ),
          const SizedBox(height: 15),
          const Divider(color: Colors.black54),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 45.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      user?.displayName as String,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email ID:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      user?.email as String,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Phone Num:',
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18,
                //       ),
                //     ),
                //     const SizedBox(width: 8),
                //     Text(
                //       user?.phoneNumber as String,
                //       style: TextStyle(
                //         fontWeight: FontWeight.normal,
                //         fontSize: 18,
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
