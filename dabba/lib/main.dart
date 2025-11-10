import 'package:flutter/material.dart';
import 'package:dabba/pages/home_page.dart';
import 'package:dabba/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DABBA',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
