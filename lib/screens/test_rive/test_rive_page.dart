import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TestRivePage extends StatefulWidget {
  const TestRivePage({Key? key}) : super(key: key);

  @override
  _TestRivePageState createState() => _TestRivePageState();
}

class _TestRivePageState extends State<TestRivePage> {
  RiveAnimationController _btnAnimationController = OneShotAnimation(
    "active",
    autoplay: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.amber[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Text(
                "this is a test and practice page with the rive animation test.",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  _btnAnimationController.isActive = true;
                  await Future.delayed(const Duration(milliseconds: 800));
                  // ignore: use_build_context_synchronously
                  showDialog(
                      context: context,
                      builder: (context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              clipBehavior: Clip.hardEdge,
                              children: [
                                Container(
                                  height: 300,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.red[200]),
                                  child: RiveAnimation.asset(
                                    "assets/RiveAssets/4054-8407-polito.riv",
                                    animations: ["Idle"],
                                  ),
                                ),
                                // Positioned.fill(
                                //   child: RiveAnimation.asset(
                                //     "assets/RiveAssets/4054-8407-polito.riv",
                                //     animations: ["Idle"],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }).then((value) => print("end dialog"));
                },
                child: SizedBox(
                    height: 64,
                    width: 260,
                    child: Stack(
                      children: [
                        RiveAnimation.asset(
                          "assets/RiveAssets/button.riv",
                          controllers: [_btnAnimationController],
                        ),
                        const Positioned.fill(
                            top: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.arrow_right),
                                SizedBox(width: 8),
                                Text(
                                  "Click here!",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
