import 'package:flutter/material.dart';
import 'package:sport_app/config/colors.dart';

class FirstPage extends StatelessWidget {
  String body;
  String photoPath;
  FirstPage({this.body, this.photoPath});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          offset: Offset(0, 4),
                          color: AppColors.black.withOpacity(0.16),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Image.asset(photoPath)),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(
                          left: 50,
                          right: 50,
                        ),
                        child: Text(
                          body,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )),
                    ],
                  ),
                ))),
      ],
    ));
  }
}
