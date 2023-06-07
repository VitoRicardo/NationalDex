import 'package:flutter/material.dart';
import 'core/api_to_page.dart';
import 'pages/testPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    PokeApiV2().getAPI();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NationalDex',
      debugShowCheckedModeBanner: false,
      home: TestPage(),
    );
  }
}
