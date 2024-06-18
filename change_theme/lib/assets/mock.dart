import 'package:change_theme/assets/app_strings.dart';
import '../domain/model/profile_model.dart';

List<Profile> mockData = [
  Profile(
    asset: IconStrings.profileImg,
    myRewards: [
      IconStrings.profileReward1,
      IconStrings.profileReward2,
      IconStrings.profileReward3,
      IconStrings.profileReward4,
      IconStrings.profileReward5
    ],
    name: 'Маркус Хассельборг',
    email: 'MarkusHSS@gmail.com',
    dataBirth: DateTime(1986, 3, 3),
    comand: 'Сборная Швеции',
    position: 'Скип',
  )
];
