void main() {
  final Set<AgriculturalMachinery> allMachines = mapBefore2010.values
      .expand(
        (territories) =>
            territories.expand((machinery) => machinery.machineries),
      )
      .toSet()
    ..addAll(mapAfter2010.values
        .expand(
          (territories) =>
              territories.expand((machinery) => machinery.machineries),
        )
        .toSet());
  final List<AgriculturalMachinery> allMachinesSorted = allMachines.toList();
  allMachinesSorted.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

  final averageAge = allMachinesSorted.fold<double>(
          0,
          (previousValue, element) =>
              previousValue +
              DateTime.now().difference(element.releaseDate).inDays) /
      365 /
      allMachinesSorted.length;

  final oldestMachineryList =
      allMachinesSorted.toList().sublist(0, allMachinesSorted.length ~/ 2);

  final oldest = oldestMachineryList.fold<double>(
          0,
          (previousValue, element) =>
              previousValue +
              DateTime.now().difference(element.releaseDate).inDays) /
      365 /
      oldestMachineryList.length;

  print('средний возраст техники $averageAge');
  print('средний возраст 50% самой старой техники $oldest');
}

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );

  @override
  String toString() {
    return '{areaInHectare: $areaInHectare, crops: $crops, machineries: $machineries}';
  }
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;

  @override
  String toString() {
    return '{id: $id, releaseDate: $releaseDate}';
  }
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};
