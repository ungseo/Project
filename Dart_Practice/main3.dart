class Player {
  late final String name;
  late int xp;
  String team;
  int age;
  //
  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age});
  //in Player methods
  void sayHello() {
    print("Hi My name is $name");
  }
}

void main() {
  var player = new Player(
    name: "ungseo",
    age: 12,
    xp: 2500,
    team: 'red',
  );
  var player2 = new Player(
    name: "babo",
    age: 12,
    xp: 2500,
    team: 'blue',
  );
  player.sayHello();
  player2.sayHello();
}
