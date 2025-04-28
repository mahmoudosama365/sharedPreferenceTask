import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
    ThemeMode currentTheme =  ThemeMode.light ;

    void changeTheme(ThemeMode newTheme)async{
        if (currentTheme == newTheme){
          return;
        }
        currentTheme = newTheme ;
         final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('theme', newTheme == ThemeMode.dark ? 'dark' : 'light' );
        notifyListeners() ;
    }
    bool isDarkMode(){
      return currentTheme == ThemeMode.dark ;
    }
}