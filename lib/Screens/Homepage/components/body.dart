import 'package:flutter/material.dart';
import '../../../components/course_details.dart';
import '../../Courses/courseContent.dart';
import '../../Menubar/side_menu.dart';
import '../category_screen.dart';
import 'utils/const.dart';
import 'widgets/card_courses.dart';
import 'widgets/header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _searchControl = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: SideMenuBar(),
      body: Stack(
        children: <Widget>[
          Header(),
          Padding(
            padding: EdgeInsets.all(Constants.mainPadding),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                // SizedBox(height: Constants.mainPadding / 6),

                // 1. Welcome User
                Text(
                  "Welcome back\nStudent!",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),

                SizedBox(height: Constants.mainPadding * 2),

                SizedBox(height: Constants.mainPadding),

                // 2. Start Learning Button Section
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xFFFEF3F3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Start Learning \nNew Stuff!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textDark),
                          ),

                          SizedBox(height: 10.0),

                          // Categories Button
                          Container(
                            width: 120,
                            child: FlatButton(
                              padding: EdgeInsets.all(10.0),
                              color: Constants.salmonMain,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "Courses",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward,
                                      color: Colors.white, size: 16),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                              ),
                              onPressed: () {
                                // Navigate to Learning
                                debugPrint("Pressed here");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryScreen()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    // Image Explore topicss
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Image.asset(
                        "assets/images/explore.png",
                        width: 180,
                        height: 135,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                Text("Popular Courses",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),

                SizedBox(height: 20.0),

                // List of courses
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/plus&minus.png",
                            width: 45, height: 45),
                        color: Constants.lightYellow,
                        title: courseDetails['add&minus']?['name'] as String,
                        hours: "Class 3 Addition and Subtraction",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'add&minus'),
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/plant.png",
                            width: 45, height: 45),
                        color: Constants.lightGreen,
                        title: courseDetails['plant']?['name'] as String,
                        hours: "Plant Life Cycle (EVS)",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'plant'),
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/division.png",
                            width: 45, height: 45),
                        color: Constants.lightBlue,
                        title: courseDetails['divide']?['name'] as String,
                        hours: "Long and Short Division",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'divide'),
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/geometry.png",
                            width: 45, height: 45),
                        color: Constants.lightBlue,
                        title: courseDetails['geometry']?['name'] as String,
                        hours: "Class 3 Geometry",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'geometry'),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
