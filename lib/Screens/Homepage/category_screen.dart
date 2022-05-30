import 'package:final_yr_project/Screens/Courses/courseContent.dart';
import 'package:flutter/material.dart';
import '../Menubar/side_menu.dart';
import 'components/utils/const.dart';
import 'components/widgets/card_courses.dart';
import 'components/widgets/header_inner.dart';
import '../../components/course_details.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          HeaderInner(),
          ListView(
            children: <Widget>[
              SizedBox(height: Constants.mainPadding * 1.2),
              Center(
                child: Text(
                  "Courses\nAvailable",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Constants.mainPadding * 2.5),
              Container(
                padding: EdgeInsets.fromLTRB(
                    Constants.mainPadding,
                    Constants.mainPadding * 2,
                    Constants.mainPadding,
                    Constants.mainPadding),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.0)),
                  color: Colors.white,
                ),
                child: ListView(
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
                        image: Image.asset("assets/images/multiplication.png",
                            width: 45, height: 45),
                        color: Constants.lightGreen,
                        title: courseDetails['multiply']?['name'] as String,
                        hours: "Class 3 Multiplication",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'multiply'),
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
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/money.png",
                            width: 45, height: 45),
                        color: Constants.lightYellow,
                        title: courseDetails['money']?['name'] as String,
                        hours: "Indian Money System",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'money'),
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/time.png",
                            width: 45, height: 45),
                        color: Constants.lightPink,
                        title: courseDetails['time']?['name'] as String,
                        hours: "Alalog Time Clock",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'time'),
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
                        image: Image.asset("assets/images/water.png",
                            width: 45, height: 45),
                        color: Constants.lightBlue,
                        title: courseDetails['water']?['name'] as String,
                        hours: "Water (EVS)",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'water'),
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/rock.png",
                            width: 45, height: 45),
                        color: Constants.lightYellow,
                        title: courseDetails['rock']?['name'] as String,
                        hours: "Rocks, Soil and Minerals (EVS)",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'rock'),
                        );
                      },
                    ),
                    GestureDetector(
                      child: CardCourses(
                        image: Image.asset("assets/images/pattern.png",
                            width: 45, height: 45),
                        color: Constants.lightPink,
                        title: courseDetails['pattern']?['name'] as String,
                        hours: "Patterns in sequence",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/coursecontent/',
                          arguments: CourseContent(course: 'pattern'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
