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

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
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

  void writePapers(String value) {
    setState(() {
      try {
        currentPapers = int.parse(value);
      } catch (e) {
        currentPapers = 0;
      }
    });
  }

  void onDonePressed() {
    int curType = currentType[currentIndex];
    setState(() {
      savedMoney[currentIndex] = currentPapers *
          (curType == 500
              ? 1
              : curType == 100
                  ? 1
                  : curType);
      totalMoney += savedMoney[currentIndex];
      currentIndex += 1;
      currentPapers = 0;
      _controller.clear();
      _focusNode.requestFocus();
    });
    if (currentIndex == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LastScreen(
                  savedMoney: savedMoney,
                )),
      );
    }
  }

  String get imagePath {
    switch (currentIndex) {
      case 0:
        return "assets/images/50000won.png";
      case 1:
        return "assets/images/10000won.png";
      case 2:
        return "assets/images/5000won.png";
      case 3:
        return "assets/images/1000won.png";
      case 4:
        return "assets/images/500won.png";
      case 5:
        return "assets/images/100won.png";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // 페이지 목록을 정의
    final List<Widget> pages = [
      Calc(
        plusPapers: plusPapers,
        minusPapers: minusPapers,
        writePapers: writePapers,
        currentType: currentType[currentIndex],
        currentPapers: currentPapers,
        onDonePressed: onDonePressed,
        controller: _controller,
        focusNode: _focusNode,
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFFCFDF7),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                '총현금 : $totalMoney',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 44,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 3,
              child: pages[0],
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Button(
                    text: '<<이전으로',
                    bgColor: Colors.deepOrange,
                    textColor: Colors.white,
                    onPressed: () {
                      if (currentIndex == 0) return;
                      setState(() {
                        totalMoney -= savedMoney[currentIndex - 1];
                        savedMoney[currentIndex - 1] = 0;
                        currentIndex -= 1;
                        currentPapers = 0;
                      });
                      _controller.clear();
                      _focusNode.requestFocus();
                    },
                  ),
                  Button(
                    text: '다음으로>>',
                    bgColor: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      onDonePressed();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
