import 'package:email_validator/email_validator.dart';

String? nameValidator(value) {
  if ((value.length < 3 || value.length > 20)) {
    return 'Укажите имя питомца от 3 до 20 символов';
  }
  return null;
}

String? dateValidator(value) {
  if (value.isEmpty) {
    return 'Укажите дату дд/мм/гггг';
  }
  return null;
}

String? weightValidator(value) {
  if (value.isEmpty || int.parse(value) < 1) {
    return 'Укажите вес, больше 0 кг';
  }
  return null;
}

String? emailValidator(value) {
  if (!EmailValidator.validate(value!)) {
    return 'Введите email';
  }
  return null;
}
