import 'package:flutter/material.dart';
import 'package:news_app_ui/screens/article_screen.dart';
import 'package:news_app_ui/screens/discover_screen.dart';
import 'package:news_app_ui/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    primarySwatch: Colors.grey,
    );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
  );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App UI',
      theme: _buildTheme(Brightness.light),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName :(context) => const HomeScreen(),
        DiscoverScreen.routeName:(context) => const DiscoverScreen(),
        ArticleScreen.routeName : (context) => const ArticleScreen(),
        
      },
    );
  }
}
