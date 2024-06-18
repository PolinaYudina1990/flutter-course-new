import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:change_theme/core/utils/theme_prefs_notif.dart';
import 'package:change_theme/domain/model/profile_model.dart';
import 'package:change_theme/presentation/profile_screen/widgets/bottom_sheet.dart';
import 'package:change_theme/presentation/profile_screen/widgets/button_log.dart';
import 'package:change_theme/presentation/profile_screen/widgets/card_container.dart';
import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../assets/app_strings.dart';
import '../../assets/mock.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mockProfile = mockData[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appBarTitleProfileScreen,
          style: context.text.appTitle,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.textButtonProfileScreen,
              style: context.text.appBarAction,
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  height: 80,
                  fit: BoxFit.fitHeight,
                  mockProfile.asset,
                ),
                Text(
                  AppStrings.textOnProfileImg,
                  style:
                      context.text.smallTitle.copyWith(color: AppColors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileBody(
              mockProfile: mockProfile,
            ),
            const ButtonLog(),
          ],
        ),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  final Profile mockProfile;
  final ThemeData? currentTheme;
  const ProfileBody({super.key, required this.mockProfile, this.currentTheme});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    void showModal(BuildContext context, ThemeNotifier themeNotifier) {
      showModalBottomSheet<void>(
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return MyBottomSheet(
            currentTheme: themeNotifier.theme,
            themeNotifier: themeNotifier,
          );
        },
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
              child: Text(
            AppStrings.titleReward,
            style: context.text.myContainerTitle,
          )),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            padding: const EdgeInsets.all(4.0),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.mockProfile.myRewards.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.mockProfile.myRewards[index],
                height: 32,
                width: 32,
              );
            },
          ),
        ),
        MyContainer(
            iconNeed: false,
            titleText: AppStrings.titleName,
            text: widget.mockProfile.name),
        MyContainer(
            iconNeed: false,
            titleText: AppStrings.titleEmail,
            text: widget.mockProfile.email),
        MyContainer(
            iconNeed: false,
            titleText: AppStrings.titleDate,
            text:
                DateFormat('dd.MM.yyyy').format(widget.mockProfile.dataBirth)),
        MyContainer(
            iconNeed: true,
            onTap: () {},
            titleText: AppStrings.titleComand,
            text: widget.mockProfile.comand),
        MyContainer(
            iconNeed: true,
            onTap: () {},
            titleText: AppStrings.titlePosition,
            text: widget.mockProfile.position),
        Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier themeNotifier, child) {
            return MyContainer(
                iconNeed: true,
                onTap: () {
                  showModal(context, themeNotifier);
                },
                titleText: AppStrings.titleTheme,
                text: themeNotifier.theme.name);
          },
        ),
      ],
    );
  }
}
