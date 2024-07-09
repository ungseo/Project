void main() {
  var name = 'ungseo';
  var age = 31;
  var greeting = 'hello my name is $name and Im ${age + 3}';
  print(greeting);
  hi();
  prac2();
  dartSet();
  dartFuction();
  print(SayHi({"asdfasdfasdf": "babo"}));
}

void hi() {
  var oldFriends = ['ungseo', 'seonho'];
  var newFriends = [
    'sibal',
    'fuck',
    for (var friend in oldFriends) "hi $friend"
  ];
  print(newFriends);
}

void prac2() {
  var player = {
    'name': 'ungseo',
    'xp': 19.99,
    'superpower': false,
  };
  print(player['name']);
}

void dartSet() {
  var numbers = {
    1,
    2,
    3,
    4,
  };
}

String sayHello(String name) => "Hello $name nice to meet you";

void dartFuction() {
  print(sayHello('kimungseo'));
  print(yourInfo(
    age: 12,
    country: 'South Korea',
    name: 'kimungseo',
  ));
}

String yourInfo(
        {required String name, required age, required String country}) =>
    "Hello $name, you are $age, and you live in $country";

typedef UserInfo = Map<String, String>;

String SayHi(UserInfo userInfo) {
  return "Hello ${userInfo['name']} nice to meet you";
}
