import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/ui/auth/login/login_screen.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class IntroScreenDemo extends StatefulWidget {
  static const String routeName = 'onboarding';

  const IntroScreenDemo({super.key});
  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  final String text = '';
   int value = 0 ;
   
   
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    TextStyle style = themeProvider.isDarkMode() 
                         ? AppStyles.medium16White: AppStyles.medium16Black ;
    return IntroductionScreen(
      globalBackgroundColor: themeProvider.isDarkMode() ? Appcolors.primaryDark 
      : Theme.of(context).focusColor,
      key: _introKey,
      pages: [
        PageViewModel(
          titleWidget:  SizedBox(
                  width: width * 0.40,
                height: height * 0.08,
                  child: Image.asset(AssetsManager.onboardingLogo,)),
          bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsManager.secondOnboardinglight,fit: BoxFit.fill,),
                  SizedBox(height: height * 0.02),
                  Text(
                    AppLocalizations.of(context)!.findEvents,
                    style: AppStyles.bold20Primary,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.exploreEvents , style: style,
                        ),
                      ),
                    ],
                  ),
                ],
          ),
        ),
        PageViewModel(
          titleWidget:  SizedBox(
                  width: width * 0.40,
                height: height * 0.08,
                  child: Image.asset(AssetsManager.onboardingLogo,)),
          bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsManager.thirdOnboardinglight,fit: BoxFit.fill,),
                  SizedBox(height: height * 0.02),
                  Text(
                     AppLocalizations.of(context)!.eventPlanningTitle,
                    style: AppStyles.bold20Primary,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.eventPlanning ,  style: style,
                        ),
                      ),
                    ],
                  ),
                ],
          ),
        ),
         PageViewModel(
          titleWidget:  SizedBox(
                  width: width * 0.40,
                height: height * 0.08,
                  child: Image.asset(AssetsManager.onboardingLogo,)),
          bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsManager.fourthOnboardinglight,fit: BoxFit.fill,),
                  SizedBox(height: height * 0.02),
                  Text(
                     AppLocalizations.of(context)!.connectAndShare,
                    style: AppStyles.bold20Primary,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                         AppLocalizations.of(context)!.shareMoments , style: style,
                        
                        ),
                      ),
                    ],
                  ),
                ],
          ),
        ),
     
      ],
      next: Padding(
        padding:  EdgeInsets.only(left: width * 0.10),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.01),
          width: width * 0.20,
          height:  height * 0.06,
          child: Icon(Icons.arrow_forward,color: Appcolors.primaryLight,),
          decoration: BoxDecoration( 
              
            color:  Appcolors.whiteColor,

            borderRadius: BorderRadius.circular(36),
            border: Border.all(color: Appcolors.primaryLight,
            width: 1)
          
          ),
          ),
      ),
      back: Padding(
        padding:  EdgeInsets.only(right: width * 0.10),
        child: Container(
        
          margin: EdgeInsets.symmetric(horizontal: width * 0.01),
          width: width * 0.20,
          height:  height * 0.06,
          decoration: BoxDecoration( 
              
            color:  Appcolors.whiteColor,

            borderRadius: BorderRadius.circular(36),
            border: Border.all(color: Appcolors.primaryLight,
            width: 1)
          
          ),
          child: Icon(Icons.arrow_back,color: Appcolors.primaryLight,),
          ),
      ),
     
      done: Padding(
        padding:  EdgeInsets.only(left: width * 0.10),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.01),
          width: width * 0.20,
          height:  height * 0.06,
          decoration: BoxDecoration( 
              
            color:  Appcolors.whiteColor,

            borderRadius: BorderRadius.circular(36),
            border: Border.all(color: Appcolors.primaryLight,
            width: 1)
          
          ),
          child: Icon(Icons.arrow_forward,color: Appcolors.primaryLight,),
          ),
      ), 
       onDone: (){
         Navigator.of(context).pushNamed(LoginScreen.routeName);
       },
      showNextButton: true,
      showDoneButton: true,
      showBackButton: true,
    );
  }
}
