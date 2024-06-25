import 'package:change_theme/assets/app_strings.dart';
import 'package:change_theme/assets/mock.dart';
import 'package:change_theme/presentation/profile_screen/photo_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(IconStrings.profileLogo)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 5,
            ),
            itemCount: profilePhotos.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoScreen(
                        currentPhoto: index,
                      ),
                    ),
                  );
                },
                child: SizedBox.expand(
                  child: Image.asset(
                    profilePhotos[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
