import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:flutter_application_2/onboarding_screen/onbording_Screen.dart';
import 'package:flutter_application_2/onboarding_screen/start_onboarding.dart';
import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/provider/language_provider.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/provider/user_provider.dart';
import 'package:flutter_application_2/ui/auth/forget_password/forget_pass_screen.dart';
import 'package:flutter_application_2/ui/auth/login/login_screen.dart';
import 'package:flutter_application_2/ui/auth/register/register_screen.dart';
import 'package:flutter_application_2/ui/event_details/edit_details.dart';
import 'package:flutter_application_2/ui/home/home_screen.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/add_event.dart';
import 'package:flutter_application_2/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
// await FirebaseFirestore.instance.disableNetwork();
 runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context)=> LanguageProvider()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => EventListProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ],
 child: Evently_app()));
}

class Evently_app extends StatelessWidget {
   Evently_app({super.key});

  late LanguageProvider languageProvider ;
  late ThemeProvider themeProvider;


  @override
  Widget build(BuildContext context) {
     languageProvider = Provider.of<LanguageProvider>(context);
     themeProvider = Provider.of<ThemeProvider>(context) ;
      savedLanguage();
      savedTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: onboardingStart.routeName,
      routes:{
        EditDetails.routeName : (context) => EditDetails(),
        IntroScreenDemo.routeName : (context) => IntroScreenDemo(),
        HomeScreen.routeName : (context) => HomeScreen(),
        onboardingStart.routeName : (context) => onboardingStart(),
        AddEvent.routeName : (context) => AddEvent(),
        LoginScreen.routeName : (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
        ForgetPassScreen.routeName : (context) => ForgetPassScreen(),
      } ,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLocal),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme ,
      
    );
  }

    savedLanguage()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
       final String? language = prefs.getString('language');
        if (language != null && language != languageProvider.currentLocal){
              languageProvider.changeLanguage(language);
             
       }
       
    }
    savedTheme()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? theme =  prefs.getString('theme');
        if (theme == 'dark' ){
            themeProvider.changeTheme(ThemeMode.dark);
        }else if(theme == 'light'){
          themeProvider.changeTheme(ThemeMode.light);
        }
    }
}