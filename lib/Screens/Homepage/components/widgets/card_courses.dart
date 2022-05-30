import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../utils/const.dart';

class CardCourses extends StatelessWidget {
  final Image? image;
  final String? title;
  final String? hours;
  final String? progress;
  final double? percentage;
  final Color? color;

  CardCourses({
    Key? key,
    @required this.image,
    @required this.title,
    this.hours,
    this.percentage,
    this.progress,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      child: Row(
        children: <Widget>[
          image as Widget,
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title as String,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.textDark),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  hours as String,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFF18C8E),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: CircularPercentIndicator(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  lineWidth: 2.0,
                  animation: true,
                  // percent: percentage as double,
                  center: Icon(Icons.play_arrow, color: Color(0xFFF18C8E)),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color(0xFFF18C8E),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
