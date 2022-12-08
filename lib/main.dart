import 'package:flutter/material.dart';
import 'package:provider1/screens/home/home_screen.dart';
import 'package:provider1/themes/theme.dart';

void main() {
  // token github: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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWS APP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
