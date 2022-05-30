import 'package:final_yr_project/Screens/Quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../constants.dart';
import '../../components/course_details.dart';
import '../Homepage/components/utils/const.dart';

class CourseContent extends StatefulWidget {
  final String? course;
  const CourseContent({
    Key? key,
    this.course,
  }) : super(key: key);

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  // late final id;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CourseContent;
    // id = args;
    var imgs = courseDetails[args.course]?['img'];
    var data = courseDetails[args.course]?['data'];
    var link = courseDetails[args.course]?['link'];
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(link as String) as String,
      flags: const YoutubePlayerFlags(
          showLiveFullscreenButton: true, autoPlay: false),
    );
    var imgLen;
    // print((imgs as List<String>)[0]);
    if (imgs != null) imgLen = (imgs as List<String>).length;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) => Scaffold(
        // backgroundColor: lightBlue1,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // primary: false,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(courseDetails[args.course as String]?['name'] as String,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 21,
              )),
          leading: GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.black87),
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/courses/', (route) => false);
              }),
          backgroundColor: lightBlue3,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(Constants.mainPadding),
          child: ListView(
            children: <Widget>[
              Text(
                (data as List<String>)[0],
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .4,
                ),
              ),
              imgs != null
                  ? Text(
                      "The below image(s) illustrates ${courseDetails[args.course as String]?['name'] as String}",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .4,
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              imgs == null
                  ? SizedBox()
                  : imgLen > 1
                      ? Column(
                          children: [
                            Center(
                              child: Image.asset(
                                (imgs as List<String>)[0],
                                width: 300,
                                height: 300,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Image.asset(
                                (imgs as List<String>)[1],
                                width: 300,
                                height: 300,
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Image.asset(
                            (imgs as List<String>)[0],
                            width: 300,
                            height: 300,
                          ),
                        ),
              SizedBox(
                height: 10,
              ),
              Text(
                'The video will further explain the concept',
                // textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              player,
              SizedBox(
                height: 20,
              ),
              Text(
                "Now that you have learned the concept, let's test your knowlegde by taking a simple quiz. Press the button below to proceed",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .4,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/quiz/',
                    arguments: QuizScreen(course: args.course),
                  );
                },
                icon: Icon(Icons.quiz_outlined),
                label: Text("Quiz"),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  elevation: 3,
                  fixedSize: Size(50, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
