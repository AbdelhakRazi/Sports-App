import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/Provider_managment/ChoosePage.dart';
import 'package:sport_app/Provider_managment/GoogleSignIn.dart';
import 'package:sport_app/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSign>(
        create: (_) => GoogleSign(),
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: ChoosePage()));
  }
}
