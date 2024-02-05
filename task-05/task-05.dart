abstract class Person {
  String get personeRole;

  String get name;

  int get age;

  String get comandName;

  @override
  String toString() {
    return '$personeRole\n Имя: $name\n Возраст: $age\n Команда: $comandName\n';
  }
}

class Gamer extends Person {
  @override
  String name;
  @override
  int age;
  @override
  String comandName;

  @override
  String personeRole;
  int gamesScore;
  String role;
  String gameStrategy;

  Gamer(
      {required this.name,
      required this.age,
      required this.comandName,
      this.personeRole = 'Геймер',
      this.gamesScore = 0,
      this.role = 'none',
      this.gameStrategy = 'none'});

  @override
  String toString() {
    String gamer =
        '${super.toString()} Количество игр: $gamesScore\n Роль: $role\n Стратегия игры: $gameStrategy\n';
    return gamer;
  }
}

class Trainer extends Person {
  @override
  String name;
  @override
  int age;
  @override
  @override
  String personeRole;
  String comandName;
  int tropheyScore;

  Trainer({
    required this.name,
    required this.age,
    required this.comandName,
    this.personeRole = 'Тренер',
    this.tropheyScore = 0,
  });

  @override
  String toString() {
    String trainer =
        '${super.toString()} Количество выигранных трофеев: $tropheyScore\n';
    return trainer;
  }
}

void main() {
  Gamer gamer1 = Gamer(
    name: 'Влад',
    age: 28,
    gamesScore: 15,
    comandName: 'T34',
    role: 'Командующий',
    gameStrategy: 'Наступление',
  );

  Trainer trainer1 = Trainer(
    name: 'Андрей',
    age: 30,
    comandName: 'T34',
    tropheyScore: 28,
  );
  print('$gamer1');
  print(trainer1);
}
