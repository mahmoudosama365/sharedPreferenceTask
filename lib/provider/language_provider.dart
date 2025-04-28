import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  

    String currentLocal = 'en';

    void changeLanguage(String newLocal)async{
        if (currentLocal == newLocal){
          return ;
        }
        currentLocal = newLocal ;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('language', newLocal);
        notifyListeners();
        
    }
 
     
   

    
}