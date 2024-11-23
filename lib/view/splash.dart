import 'package:addtocart/utils/colors.dart';
import 'package:addtocart/view/home.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _showLottie = false;

  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 1), () {
    //   setState(() {
    //     _showLottie = true;
    //   });

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.secondaryColor.withOpacity(0.8),
      // body: Stack(
      //   children: [
      //     Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      // AnimatedOpacity(
      //   opacity: _showLottie ? 0.0 : 1.0,
      //   duration: const Duration(seconds: 1),
      //   child: Container(
      //     width: 250,
      //     height: 100,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(25),
      //       image: DecorationImage(
      //         image: AssetImage("assets/Homelogo.png"),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      // ),
      // const SizedBox(height: 10),
      // if (_showLottie)
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          child: Lottie.asset(
            "assets/Animation - 1730838430402.json",
            fit: BoxFit.contain,
            repeat: true,
            reverse: false,
          ),
        ),
      ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}
