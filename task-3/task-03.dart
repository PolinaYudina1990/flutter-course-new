List<String> listToBuy = []; //СПИСОК ПОКУПОК
List<String> listProduct = []; //СПИСОК ПРОДУКТОВ ДОМА
List<String> listIngredients = []; //СПИСОК НЕОБХОДИМЫХ ИНГРИДИЕНТОВ

void main() {
  //Выбрать блюда для приготовления
  ChooseDishes();
  if (listIngredients.isNotEmpty) {
    //проверить ингридиенты по наличию
    CheckIngredients();
    if (listToBuy.isNotEmpty) {
      print(listToBuy);
      GoToStore();
      BuyProducts();
      Cook();
    } else {
      Cook();
    }
  }
}

void ChooseDishes() {
  listIngredients.add(ingredients);
}

void CheckIngredients() {
  for (var ingredient in listIngredients) {
    if (listProduct.contains(ingredient)) {
      print('Ингридиент уже есть');
    } else {
      listToBuy.add(ingredient);
    }
  }
}
