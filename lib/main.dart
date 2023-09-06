import 'package:flutter/material.dart';

import 'package:my_mobile_app/quote_genie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuoteGenie Demo App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const QuoteGenie(),
    );
  }
}
