import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/Provider_managment/GoogleSignIn.dart';
import 'package:sport_app/views/screens/Home%20screens/Home.dart';
import 'package:sport_app/views/screens/LandingPages/Landing.dart';

class ChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<GoogleSign>(context).isSignedIn == false) {
      return Landing();
    } else {
      return Home();
    }
  }
}
