import 'package:flutter/material.dart';
import 'package:sport_app/config/colors.dart';

class TabWidget extends StatefulWidget {
  @override
  String text;
  Color textcolor;
  Color cardColor;
  TabWidget({this.text, this.textcolor, this.cardColor});
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    return GridView.extent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 0.7,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      children: [
        CardWidget(
          text: "Daily\nWarm Up",
          textColor: AppColors.text_pink,
          cardColor: AppColors.card_pink,
          imagePath: "assets/pictures/grid1.png",
        ),
        CardWidget(
          text: "Introductory\nTraining",
          imagePath: "assets/pictures/grid2.png",
          textColor: AppColors.text_orange,
          cardColor: AppColors.card_orange,
        ),
        CardWidget(
          imagePath: "assets/pictures/grid3.png",
          text: "Home arms\nWorkout",
          textColor: AppColors.text_green,
          cardColor: AppColors.card_green,
        ),
        CardWidget(
          imagePath: "assets/pictures/grid4.png",
          text: "Home leg\nWorkout",
          textColor: AppColors.text_blue,
          cardColor: AppColors.card_blue,
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color cardColor;
  final String imagePath;
  const CardWidget(
      {Key key, this.text, this.textColor, this.cardColor, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: textColor),
            ),
          ),
          Center(child: Image.asset(imagePath)),
        ],
      ),
    );
  }
}
