import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GlobalKey를 사용하여 Scaffold를 참조합니다.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoginForm = true;
  bool isLogined = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Scaffold에 key를 설정합니다.
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFDF7),
        title: const Text(
          'CalcuRail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(1),
          child: Image.asset('assets/Logo.jpg'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // ScaffoldKey를 통해 Drawer를 엽니다.
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 50, left: 0),
            child: Text(
              isLoginForm ? '로그인' : '회원가입',
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (isLoginForm) ...[
            const Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ID를 입력 해주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password를 입력 해주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                width: 300, // 버튼의 너비
                height: 60, // 버튼의 높이
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 동작할 코드
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // 텍스트 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                    ),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold), // 텍스트 스타일
                  ),
                  child: const Text('로그인'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isLoginForm = false;
                  });
                },
                child: const Text('회원이 아니신가요?'),
              ),
            )
          ] else ...[
            const Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ID를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password를 입력 해주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(40),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password를 확인 해주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                width: 300, // 버튼의 너비
                height: 60, // 버튼의 높이
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 동작할 코드
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // 텍스트 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                    ),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold), // 텍스트 스타일
                  ),
                  child: const Text('가입하기'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isLoginForm = true;
                  });
                },
                child: const Text('이미 회원이신가요?'),
              ),
            )
          ]
        ],
      ),
    );
  }
}
