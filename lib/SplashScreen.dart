import 'package:flutter/material.dart';
import 'package:project_is_it/home.dart';
import 'package:project_is_it/loginPage.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),
          () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Loginpage(),)),
    );
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Center(child: Image.asset("assets/images/worldwide.png",height: 100,width: 100,))
        ],
      ),
    );
  }
}
