import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestAnimatePage extends StatefulWidget {
  const TestAnimatePage({Key? key}) : super(key: key);

  @override
  _TestAnimatePageState createState() => _TestAnimatePageState();
}

class _TestAnimatePageState extends State<TestAnimatePage> {
  double edgeValue = 300;
  bool testColor = true;
  bool testText = true;
  bool testPosition = true;
  bool testScale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.bounceOut,
            top: testPosition ? 0 : 400,
            left: 36,
            right: 36,
            child: SizedBox(
              height: edgeValue,
              width: edgeValue,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    height: edgeValue,
                    width: edgeValue,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: testColor ? Colors.red[200] : Colors.yellow[200],
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: animation,
                              child: child,
                            ));
                      },
                      child: (testText)
                          ? Text(
                              "Hi",
                              // key: ValueKey("Hi"),
                              key: UniqueKey(),
                              style: const TextStyle(
                                  fontSize: 88, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Hello",
                              // key: ValueKey("Hello"),
                              key: UniqueKey(),
                              style: const TextStyle(
                                  fontSize: 88, fontWeight: FontWeight.bold),
                            ),
                    )),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    testColor = !testColor;
                    testText = !testText;
                    testPosition = !testPosition;
                    testScale = !testScale;
                  });
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 56)),
                icon: const Icon(Icons.add),
                label: const Text(
                  "Change color.",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SafeArea(child: Container()),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          // ),
          Positioned(
            top: 100,
            left: 100,
            child: TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween(begin: 0.0, end: testScale ? 1.0 : 2.0),
              duration: const Duration(milliseconds: 800),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
