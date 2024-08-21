import 'package:flutter/material.dart';
import 'package:ko_app/widgets/button.dart';
import 'package:ko_app/screens/first_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFCFDF7),
        body: Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'CalcuRail ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '정산하기 앱  ',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(0, 255, 201, 40),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                Button(
                  text: '정산하기',
                  bgColor: const Color(0xFFF1B33B),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstScreen()),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}