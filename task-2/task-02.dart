enum Brand { samsung, apple, xiaomi, realme }

class Phone {
  final Brand brand;
  final String model;
  final double display;
  final String battery;
  final Camera camera;
  bool isOn = false;

  Phone(
      {required this.brand,
      required this.model,
      required this.display,
      required this.battery,
      required this.isOn,
      required this.camera});

  Phone.samsung(
      {required this.model,
      required this.display,
      required this.battery,
      required this.isOn,
      required this.camera})
      : brand = Brand.samsung;

  void turnOn() {
    print('Телефон включен');
    isOn = true;
  }

  String getPhoneInfo() {
    String status = isOn == true ? 'включен' : 'выключен';
    return 'Марка: $brand, Модель: $model, Дисплей: $display, Батарея: $battery, Камера: $camera, $status ';
  }
}

class Camera {
  int megapixels;
  int lenses;

  Camera(this.megapixels, this.lenses);

  @override
  String toString() {
    var aboutCamera = "$megapixels мегапикселей, $lenses линзы";
    return aboutCamera;
  }
}

void main() {
  final Camera camera45 = Camera(45, 3);
  final Camera camera50 = Camera(50, 3);
  Phone phoneS10E = Phone.samsung(
      model: 's10e',
      display: 6.7,
      battery: '4441 мАч',
      camera: camera45,
      isOn: false);

  print(phoneS10E.getPhoneInfo());
}
