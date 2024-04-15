import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $userName!'),
      ),
      body: Container(
        child: Center(
          child: Text('Welcome to the homepage, $userName!'),
        ),
      ),
    );
  }
}
