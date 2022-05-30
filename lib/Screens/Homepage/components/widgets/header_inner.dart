import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../utils/const.dart';

class HeaderInner extends StatelessWidget {
  const HeaderInner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30.0)),
              color: Constants.blueLight,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset("assets/images/blob_2.png",
                      width: 330, height: 320, color: Constants.blueDark),
                  top: -100,
                  right: -130,
                ),
                Positioned(
                  child: Image.asset("assets/images/blob_1.png",
                      width: 290, height: 290, color: Constants.blueMain),
                  top: 20,
                  left: -100,
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
