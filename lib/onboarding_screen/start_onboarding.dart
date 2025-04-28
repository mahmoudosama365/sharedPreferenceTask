import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/onboarding_screen/onbording_Screen.dart';
import 'package:flutter_application_2/provider/language_provider.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class onboardingStart extends StatefulWidget {
  static const String routeName = 'startOnboarding';
    onboardingStart({super.key,});
  static bool positive = false;
  @override
  State<onboardingStart> createState() => _StartOnboardingState();
}

class _StartOnboardingState extends State<onboardingStart> {
  bool lightordark = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode()
            ? Appcolors.primaryDark
            : Appcolors.whiteBgColor,
        title: Padding(
          padding: EdgeInsets.only(top: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: width * 0.40,
                  height: height * 0.08,
                  child: Image.asset(
                    AssetsManager.onboardingLogo,
                  )),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                themeProvider.isDarkMode()
                    ? AssetsManager.firstOnboardingdark
                    : AssetsManager.firstOnboardinglight,
                fit: BoxFit.fill,
              ),
              SizedBox(height: height * 0.01),
              Text(
                AppLocalizations.of(context)!.personalize,
                style: AppStyles.bold20Primary,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.getStartedMessage,
                      style: themeProvider.isDarkMode()
                          ? AppStyles.medium16White
                          : AppStyles.medium16Black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: AppStyles.medium20Primary,
                  ),
                  AnimatedToggleSwitch.dual(
                    current: onboardingStart.positive,
                    first: false,
                    second: true,
                    iconBuilder: (value) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(value
                                    ? AssetsManager.arabic
                                    : AssetsManager.english))),
                      );
                    },
                    textBuilder: (value) {
                      return value
                          ? Text(
                              'Arabic',
                              style: AppStyles.regular16White,
                            )
                          : Text('English', style: AppStyles.regular16White);
                    },
                    style: ToggleStyle(
                      indicatorColor: Appcolors.transparentColor,
                      borderColor: Appcolors.primaryLight,
                      backgroundColor: Appcolors.primaryLight,
                    ),
                    onChanged: (value)  {
                      

                      onboardingStart.positive = value;

                      setState(() {
                        languageProvider.changeLanguage(onboardingStart.positive ? 'ar' : 'en');
                      });
                    },
                    spacing: 26,
                    height: 45,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: AppStyles.medium20Primary,
                  ),
                  AnimatedToggleSwitch.dual(
                    current: lightordark,
                    first: false,
                    second: true,
                    iconBuilder: (value) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(value
                                    ? AssetsManager.moonIcon
                                    : AssetsManager.sunIcon))),
                      );
                    },
                    textBuilder: (value) {
                      return value
                          ? Text(
                              'Dark',
                              style: AppStyles.regular16White,
                            )
                          : Text('Light', style: AppStyles.regular16White);
                    },
                    style: ToggleStyle(
                      indicatorColor: Appcolors.transparentColor,
                      borderColor: Appcolors.primaryLight,
                      backgroundColor: Appcolors.primaryLight,
                    ),
                    onChanged: (value) {
                      lightordark = value;
                      setState(() {
                        themeProvider.changeTheme(
                            lightordark ? ThemeMode.dark : ThemeMode.light);
                      });
                    },
                    spacing: 26,
                    height: 45,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.91,
                height: height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    Navigator.of(context).pushNamed(IntroScreenDemo.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.lets_start,
                    style: AppStyles.medium20White,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
