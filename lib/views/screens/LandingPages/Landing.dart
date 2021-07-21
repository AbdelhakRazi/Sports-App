import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/Provider_managment/ChoosePage.dart';
import 'package:sport_app/Provider_managment/GoogleSignIn.dart';
import 'package:sport_app/config/colors.dart';
import 'package:sport_app/views/screens/LandingPages/AnimatedPage.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with TickerProviderStateMixin {
  @override
  AnimationController _controller;
  AnimationController _secondcontroller;
  AnimationController _thirdcontroller;
  Animation<double> _animation;
  Animation<double> _secondanimation;
  Animation<double> _thirdanimation;
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 1500), () {
            _controller.reverse();
            _secondcontroller.forward();
          });
        }
      });
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _secondcontroller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(Duration(milliseconds: 1500), () {
                _thirdcontroller.forward();
                _secondcontroller.reverse();
              });
            }
          });
    _thirdcontroller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(Duration(milliseconds: 1500), () {
                _controller.forward();
                _thirdcontroller.reverse();
              });
            }
          });
    _secondanimation =
        CurvedAnimation(parent: _secondcontroller, curve: Curves.easeIn);
    _thirdanimation =
        CurvedAnimation(parent: _thirdcontroller, curve: Curves.easeIn);
  }

  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: screen_height / 6),
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: FirstPage(
                    body: "Master Study is the best choice for everyone",
                    photoPath: "assets/pictures/firstLanding.png",
                  ),
                ),
                FadeTransition(
                    opacity: _secondanimation,
                    child: FirstPage(
                      body: "Learn Anytime, Anywhere.Accelerate your Future.",
                      photoPath: "assets/pictures/secondLanding.png",
                    )),
                FadeTransition(
                    opacity: _thirdanimation,
                    child: FirstPage(
                      body: "Set High Standards And Few Limitations",
                      photoPath: "assets/pictures/thirdLanding.png",
                    )),
              ],
            ),
          ),
          SizedBox(height: screen_height / 15),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.7,
              widthFactor: 0.85,
              child: RaisedButton(
                color: AppColors.google_color,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: screen_width * 0.05,
                    ),
                    Text(
                      "Sign in Using Google",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ],
                ),
                elevation: 3,
                onPressed: () {
                  Provider.of<GoogleSign>(context, listen: false)
                      .signInwithGoogle();
                },
              ),
            ),
          ),
          SizedBox(height: screen_height * 0.015),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.7,
              widthFactor: 0.85,
              child: RaisedButton(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.facebook,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: screen_width * 0.05,
                    ),
                    Text(
                      "Sign in Using Facebook",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ],
                ),
                elevation: 3,
                onPressed: () {
                  Provider.of<GoogleSign>(context, listen: false)
                      .signInwithFacebook();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
