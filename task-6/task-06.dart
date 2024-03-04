class Product {
  final int id;
  final String category;
  final String name;
  final double price;
  final int quantity;

  @override
  String toString() {
    return '$id $category $name $price рублей $quantity шт';
  }

  const Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

abstract interface class Filter<T> {
  bool apply(Product product);
}

class FilterCategory implements Filter<String> {
  final String category;
  const FilterCategory(this.category);
  @override
  bool apply(Product product) => product.category == category;
}

class FilterPrice implements Filter<double> {
  final double price;
  const FilterPrice(this.price);
  @override
  bool apply(Product product) => product.price == price;
}

class FilterQuantity implements Filter<int> {
  final int quantity;
  const FilterQuantity(this.quantity);
  @override
  bool apply(Product product) => product.quantity < quantity;
}

void main() {
  print(
    applyFilter(articlesConvert(articles), FilterCategory('хлеб')),
  );

  print(
    applyFilter(articlesConvert(articles), FilterPrice(500)),
  );

  print(
    applyFilter(articlesConvert(articles), FilterQuantity(99)),
  );
}

List<Product> addList = [];
List<Product> applyFilter(List<Product> products, Filter filter) {
  addList.clear();
  for (var product in products) {
    if (filter.apply(product)) {
      addList.add(product);
    }
  }

  return addList;
}

List<Product> articlesConvert(String articles) {
  final articlesAdd = articles.split('\n');

  articlesAdd.removeWhere((element) => element == '');

  final articlesMap = articlesAdd.map((element) {
    final fields = element.split(',');
    return Product(
      id: int.parse(fields[0]),
      category: fields[1],
      name: fields[2],
      price: double.parse(fields[3]),
      quantity: int.parse(fields[4]),
    );
  }).toList();

  return articlesMap;
}

final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';
