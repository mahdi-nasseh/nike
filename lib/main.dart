import 'package:flutter/material.dart';
import 'package:nike/theme.dart';
import 'package:nike/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const defualFont = TextStyle(
        fontFamily: 'iranyekan', color: ThemeLightColor.primaryTextColor);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: ThemeLightColor.primaryColor,
          secondary: ThemeLightColor.secondaryColor,
          onSecondary: Colors.white,
          surface: ThemeLightColor.secondaryColor,
        ),
        textTheme: TextTheme(
          bodySmall:
              defualFont.copyWith(color: ThemeLightColor.secondaryTextColor),
          titleLarge: defualFont.copyWith(fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
    );
  }
}
