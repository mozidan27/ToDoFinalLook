import 'package:flutter/material.dart';
import 'package:todo/Pages/home_page.dart';
import 'package:todo/widgets/mybutton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _myController = TextEditingController();

  void _navigate(BuildContext context) {
    final String userName = _myController.text.trim();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return HomePage(userName: userName);
      },
    ));
    _myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb28bfe),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/WB.jpg'),
                radius: 190,
              ),
              const SizedBox(height: 20),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _myController,
                decoration: InputDecoration(
                  fillColor: Colors.purple[900],
                  filled: true,
                  hintText: "Enter Your Name",
                  hintStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () => _navigate(context),
                child: const MyButton(
                  buttonName: "LET'S GO",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
