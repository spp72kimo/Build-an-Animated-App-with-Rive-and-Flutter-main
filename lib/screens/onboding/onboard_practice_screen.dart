// import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/animated_practice_btn.dart';
import 'components/practice_sign_in_dialog.dart';

class OnboardPracticeScreen extends StatefulWidget {
  const OnboardPracticeScreen({Key? key}) : super(key: key);

  @override
  _OnboardPracticeScreenState createState() => _OnboardPracticeScreenState();
}

class _OnboardPracticeScreenState extends State<OnboardPracticeScreen> {
  late RiveAnimationController _btnAnimationController;
  bool isSignInDialogShown = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 200,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            child: const SizedBox(),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        )),
        AnimatedPositioned(
          top: isSignInDialogShown ? -50 : 0,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 240),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 260,
                      child: Text(
                        "Learn desgin & code",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "Poppins",
                          height: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                    )
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  press: () {
                    _btnAnimationController.isActive = true;
                    Future.delayed(const Duration(milliseconds: 800), () {
                      setState(() {
                        isSignInDialogShown = true;
                      });
                      customSignInDialog(
                        context,
                        onClose: (_) {
                          setState(() {
                            isSignInDialogShown = false;
                          });
                        },
                      );
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                ),
              ],
            ),
          )),
        )
      ]),
    );
  }
}
