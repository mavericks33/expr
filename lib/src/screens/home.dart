import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const Center(
          child: Text('Hello Home')
        ),
      )
    );
  }

}