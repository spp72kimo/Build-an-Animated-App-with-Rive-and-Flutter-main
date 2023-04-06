import 'dart:ui';

import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Container(
            width: 500,
            height: 500,
            color: Colors.red[200],
            child: Stack(
                // fit: StackFit.passthrough,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue[200],
                  ),
                  const Positioned(
                    top: 50,
                    left: 50,
                    child: Text(
                      "Hello flutter",
                      style: TextStyle(fontSize: 70),
                    ),
                  ),
                  // BackdropFilter(
                  //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  //   child: SizedBox(),
                  // )
                ]),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.green, width: 3)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: ElevatedButton(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            )),
                      );
                    });
              },
              child: Text("小視窗按鈕"))
        ],
      )),
    );
  }
}
