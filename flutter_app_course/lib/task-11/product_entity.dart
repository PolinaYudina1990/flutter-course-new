class ProductEntity {
  final String title;

  /// Подумайте и ответьте на три вопроса:
  /// 1. Почему цена хранится в копейках, а не в рублях?
  /// ошибки округления
  /// 2. Почему тип данных цены - [int], а не [double]?
  /// если я правльно из документации, тип int автоматически конвертируется в double при необходимости и у него есть дополнительные операторы сравнения
  /// The int type specifies the traditional bitwise shift (<<, >>, >>>), complement (~), AND (&), OR (|), and XOR (^) operators, which are useful for manipulating and masking flags in bit fields
  /// 3. Как можно было реализовать передачу цены иначе?
  /// num

  final int price;
  final Category category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });
}

sealed class Amount {
  int get value;
}

class Grams implements Amount {
  @override
  final int value;
  Grams(this.value);
}

class Quantity implements Amount {
  @override
  final int value;
  Quantity(this.value);
}

enum Category {
  food('Продукты питания'),
  tech('Технологичные товары'),
  care('Уход'),
  drinks('Напитки'),
  drugs('Медикаменты');

  final String name;

  const Category(this.name);
}
