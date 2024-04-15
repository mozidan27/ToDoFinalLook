import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todo/Pages/home_page.dart';
import 'package:todo/widgets/mybutton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _navigation(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const HomePage();
      },
    ));
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
              const Gap(50),
              TextField(
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
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const Gap(100),
              GestureDetector(
                onTap: () => _navigation(context),
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
