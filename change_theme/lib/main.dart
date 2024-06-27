import 'package:change_theme/core/utils/theme_prefs_notif.dart';
import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/profile_screen/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(prefs),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) {
        return MaterialApp(
          theme: getTheme(themeNotifier.theme),
          themeMode: themeNotifier.theme.themeMode(),
          home: const Scaffold(body: ProfileScreen()),
        );
      },
    );
  }
}
