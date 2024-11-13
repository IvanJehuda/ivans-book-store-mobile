import 'package:flutter/material.dart';
import 'package:ivans_book_store/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber,).copyWith(secondary: Colors.amber[900]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}