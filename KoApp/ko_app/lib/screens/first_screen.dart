import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ko_app/screens/last_screen.dart';
import 'package:ko_app/widgets/button.dart';
import 'package:ko_app/widgets/calc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int totalMoney = 0;
  int currentPapers = 0;
  List<int> currentType = [50000, 10000, 5000, 1000, 500, 100];
  int currentIndex = 0;
  List<int> savedMoney = [0, 0, 0, 0, 0, 0];
  void plusPapers() {
    setState(() {
      currentPapers += 1;
    });
  }

  void minusPapers() {
    if (currentPapers <= 0) return;
    setState(() {
      currentPapers -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 페이지 목록을 정의
    final List<Widget> pages = [
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
      ),
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
      ),
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
      ),
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
      ),
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
      ),
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '총현금 : $totalMoney',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 44,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: pages[0],
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  text: '<<이전으로',
                  bgColor: Colors.amber,
                  textColor: Colors.white,
                  onPressed: () {
                    if (currentIndex == 0) return;
                    setState(() {
                      totalMoney -= savedMoney[currentIndex - 1];
                      savedMoney[currentIndex - 1] = 0;
                      currentIndex -= 1;
                      currentPapers = 0;
                    });
                  },
                ),
                Button(
                  text: '다음으로>>',
                  bgColor: const Color.fromARGB(255, 16, 226, 9),
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      savedMoney[currentIndex] =
                          currentPapers * currentType[currentIndex];
                      totalMoney += savedMoney[currentIndex];
                      currentIndex += 1;
                      currentPapers = 0;
                    });
                    if (currentIndex == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LastScreen(
                                  savedMoney: savedMoney,
                                )),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
