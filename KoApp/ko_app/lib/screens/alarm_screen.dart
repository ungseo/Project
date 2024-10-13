import 'package:flutter/material.dart';
import 'package:ko_app/main.dart';
import 'package:ko_app/screens/first_screen.dart';
import 'package:ko_app/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late bool savedUserInfo;
  Map<String, String> userInfo = {'teamName': '', 'userName': ''};

  @override
  void initState() {
    super.initState();
    getUserInfo(); // 비동기 메서드를 initState에서 호출
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? teamName = prefs.getString('teamName');
    String? userName = prefs.getString('userName');

    if (teamName == null || userName == null) {
      setState(() {
        savedUserInfo = false;
      });
      return;
    }
    setState(() {
      savedUserInfo = true;
      userInfo['teamName'] = teamName;
      userInfo['userName'] = userName;
    });
  }

  void saveUserInfo(String team, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('teamName', team);
    await prefs.setString('userName', name);
    getUserInfo(); // 정보를 저장하고 나서 다시 가져오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  savedUserInfo
                      ? '${userInfo['teamName']!}조, ${userInfo['userName']!}님 안녕하세요.'
                      : '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SettingsSheet(
                              teamName: userInfo['teamName']!,
                              userName: userInfo['userName']!,
                              saveUserInfo: (team, name) {
                                saveUserInfo(team, name);
                              },
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.settings),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const App()),
                        );
                      },
                      icon: const Icon(Icons.home),
                    ),
                  ],
                )
              ],
            ),
          ), //navvar 로 사용
        ],
      ),
    );
  }
}

class SettingsSheet extends StatefulWidget {
  const SettingsSheet(
      {super.key,
      required this.teamName,
      required this.userName,
      required this.saveUserInfo});
  final String teamName;
  final String userName;
  final void Function(String, String) saveUserInfo;

  @override
  State<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  late String teamName = widget.teamName;
  late String userName = widget.userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 450,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text(
                '사용자 설정',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
              )
            ],
          ),
          const Text(
            '조 설정',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                RadioListTile<String>(
                  title: const Text('A조'),
                  value: 'A',
                  groupValue: teamName,
                  onChanged: (String? newValue) {
                    setState(() {
                      teamName = newValue!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('B조'),
                  value: 'B',
                  groupValue: teamName,
                  onChanged: (String? newValue) {
                    setState(() {
                      teamName = newValue!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('C조'),
                  value: 'C',
                  groupValue: teamName,
                  onChanged: (String? newValue) {
                    setState(() {
                      teamName = newValue!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('D조'),
                  value: 'D',
                  groupValue: teamName,
                  onChanged: (String? newValue) {
                    setState(() {
                      teamName = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const Text(
            '사용자이름',
            style: TextStyle(fontSize: 24),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                userName = value;
              });
            },
            controller: TextEditingController(
                text:
                    userName), // Ensure the text field shows the current userName
          ),
          Button(
            text: '저장하기',
            bgColor: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              widget.saveUserInfo(teamName, userName);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
