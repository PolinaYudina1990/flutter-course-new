import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задание — Визитка'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/profile.jpg',
                height: 200,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    child: const Text('Юдина Полина Руслановна'),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text('ФИО'),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    child:
                        const Text('Экономист, переучиваюсь на программиста'),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text('О себе'),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    child: const Text('всякие поделки своими руками'),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text('Увлечения'),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    child: const Text('Есть один проектик)'),
                  ),
                ),
                Positioned(
                  top: -5,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text('Опыт в разработке'),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
