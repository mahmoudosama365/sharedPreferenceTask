import 'package:flutter/material.dart';
import 'package:flutter_application_2/Onboarding_screen.dart';
import 'package:flutter_application_2/home_screen.dart';
import 'package:flutter_application_2/provider/most_recent_provider.dart';
import 'package:flutter_application_2/tabs/quran/Sura_details_screen.dart';
import 'package:flutter_application_2/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => MostRecentListProvider(),
    child: const Islami_APP()));
}
class Islami_APP extends StatelessWidget {
  const Islami_APP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreenDemo.routeName,
      routes: {
         IntroScreenDemo.routeName : (context) => const IntroScreenDemo(),
         HomeScreen.routeName : (context) => HomeScreen(),
         SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
      },
    );
  }
}