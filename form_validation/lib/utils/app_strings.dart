abstract class AppStrings {
  static const petProfileIconNavText1 = 'Собака';
  static const petProfileIconNavText2 = 'Кошка';
  static const petProfileIconNavText3 = 'Попугай';
  static const petProfileIconNavText4 = 'Хомяк';
  static const pasportPageName = 'Имя питомца';
  static const pasportPageDate = 'День рождения питомца';
  static const pasportWeight = 'Вес, кг';
  static const pasportPageEmail = 'Почта хозяина';
  static const pasportPageTitleVaccine = 'Сделаны прививки от:';
  static const pasportPageSubtitleVaccine = 'Дата последней прививки';
}

abstract class IconStrings {
  static const catIcon = 'assets/icons/cat.png';
  static const dogIcon = 'assets/icons/dog.png';
  static const parrotIcon = 'assets/icons/parrot.png';
  static const hamsterIcon = 'assets/icons/hamster.png';
}

enum Pet {
  dog,
  cat,
  parrot,
  hamster,
}
