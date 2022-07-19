import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ping_coming_soon_page/screens/homePage.dart';
import 'package:provider/provider.dart';
import 'package:ping_coming_soon_page/utils/emailTextProvider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EmailText(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
