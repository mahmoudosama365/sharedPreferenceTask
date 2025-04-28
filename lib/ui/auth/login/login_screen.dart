import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/onboarding_screen/start_onboarding.dart';
import 'package:flutter_application_2/provider/language_provider.dart';
import 'package:flutter_application_2/ui/auth/forget_password/forget_pass_screen.dart';
import 'package:flutter_application_2/ui/auth/register/register_screen.dart';
import 'package:flutter_application_2/ui/home/home_screen.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/widget/custom_elevated_button.dart';
import 'package:flutter_application_2/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});
  static const String routeName = 'login' ;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool positive = false;
  var formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
     var languageProvider = Provider.of<LanguageProvider>(context) ;
    return Scaffold(
      backgroundColor: Appcolors.whitecolor,
        body: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.02,),
                  Image.asset(AssetsManager.loginLogo,height: height * 0.25,),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    prefixIcon: Image.asset(AssetsManager.emailIcon),
                    hintText: AppLocalizations.of(context)!.email,
                    controller: emailController,
                    validator: (text){
                        if (text == null ||text.isEmpty){
                        return 'Please enter a valid email address.' ;
                      }
                      return null ;
                    },
                  ),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    prefixIcon: Image.asset(AssetsManager.lockIcon),
                    hintText: AppLocalizations.of(context)!.password,
                    controller: passwordController,
                    suffixIcon: Image.asset(AssetsManager.eyeSlash),
                    validator: (text){
                        if (text!.isEmpty){
                        return 'Password is required.' ;
                      }
                      return null ;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(ForgetPassScreen.routeName);
                        },
                        child: Text(AppLocalizations.of(context)!.forget_password,
                        style: AppStyles.bold16Primary.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Appcolors.primaryLight,
                        ),),
                      ),
                    ],
                  ),
                   SizedBox(height: height * 0.02,),
                  CustomElevatedButton(
                    onButtonClick: login,
                   text: AppLocalizations.of(context)!.login),
                  SizedBox(height: height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.do_not_have_an_account,style: 
                      AppStyles.medium16Black,),
                     
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(RegisterScreen.routeName);
                        }, 
                        child: Text(AppLocalizations.of(context)!.create_account,
                        style: AppStyles.medium20Primary.copyWith(
                          decorationColor: Appcolors.primaryLight,
                          decoration: TextDecoration.underline,
                          fontSize: 16
                        ) ,) ),
                    ],
                  ),
                  SizedBox(height: height * 0.02,),
                  Row(
                    children: [
                      Expanded(child: Divider(
                        thickness: 2,
                        color: Appcolors.primaryLight,
                        indent: width * 0.02 ,
                        endIndent: width * 0.02 ,
                      )),
                      Text(AppLocalizations.of(context)!.or,
                      style:AppStyles.medium16Primary ,),
                       Expanded(child: Divider(
                        thickness: 2,
                        color: Appcolors.primaryLight,
                        indent: width * 0.02 ,
                        endIndent: width * 0.02 ,
                       )),
                    ],
                  ),
                  SizedBox(height: height * 0.02,),
                 ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.015
                    ),
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Appcolors.primaryLight,
                        width: 1,
                      )
                    )
                  ),
                  onPressed: (){}, 
                 
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Image.asset(AssetsManager.googleIcon,),
                    SizedBox(width: width * 0.03,),
                    Text(AppLocalizations.of(context)!.login_with_google,style: AppStyles.medium20Primary,),
                  ],
                 )),
                 SizedBox(height: height * 0.02,),
                  Center(
                    child: AnimatedToggleSwitch.dual(
                              current: onboardingStart.positive,
                              first: false,
                              second: true,
                              iconBuilder: (value) {
                                return Container(
                                    decoration: BoxDecoration(
                                       
                                      image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image:AssetImage(
                                        value ? AssetsManager.arabic : AssetsManager.english
                                      )
                                      )
                                    ),
                                );
                              },
                             textBuilder: (value) {
                              return value ? Text('Arabic',style: AppStyles.regular16White,) 
                              : Text('English',style: AppStyles.regular16White) ;
                             },
                             
                              style: ToggleStyle(
                               indicatorColor: Appcolors.transparentColor,
                               borderColor: Appcolors.primaryLight,
                               backgroundColor: Appcolors.primaryLight,
                              ),
                              
                              onChanged: (value) {
                                onboardingStart.positive = value;
                                setState(() {
                                  languageProvider.changeLanguage(onboardingStart.positive ? 'ar' : 'en');
                                });
                                
                              },
                              spacing: 26,
                              height: 45,
                            ),
                  ),
                        
                  
                ],
              ),
            ),
          ),
        ),
    );
  }

  void login(){
    if(formKey.currentState?.validate() == true){
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }
     
    
  }
}