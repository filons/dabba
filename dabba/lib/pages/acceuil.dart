import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String titre;
  const MyHomePage({super.key, required this.titre});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titre),
        leading: Drawer(),
        elevation: 12,
      ),
      body: Center(child: Text('Bienvenue à ${widget.titre}!')),
    );
  }
}
