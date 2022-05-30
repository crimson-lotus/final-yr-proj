import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../utils/const.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(45.0)),
              color: Constants.salmonMain,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset("assets/images/blob_2.png",
                      width: 330, height: 300, color: Constants.salmonDark),
                  top: -100,
                  right: -130,
                ),
                Positioned(
                  child: Image.asset("assets/images/blob_1.png",
                      width: 280, height: 280, color: Constants.salmonLight),
                  top: 20,
                  left: -100,
                ),
                Positioned(
                  child: Image.asset("assets/images/boy_studying.png",
                      width: 175, height: 240),
                  bottom: 0,
                  right: -10,
                ),
              ],
            ),
          ),
          flex: 1,
        ),
        Expanded(child: Container(), flex: 1)
      ],
    );
  }
}
