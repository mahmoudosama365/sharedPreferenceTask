import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/auth/login/login_screen.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/widget/custom_elevated_button.dart';
import 'package:flutter_application_2/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  static const String routeName = 'register' ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Appcolors.whiteColor,
      appBar: AppBar(
        backgroundColor: Appcolors.whiteColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.register,
        style: AppStyles.medium20Black,) ,
      ),
        body: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               
                Image.asset(AssetsManager.loginLogo,height: height * 0.20,),
                SizedBox(height: height * 0.02,),
                 
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.nameIcon),
                  hintText: AppLocalizations.of(context)!.name,
                  controller: emailController,
                  validator: (text){
                      
                  },
                ),
                SizedBox(height: height * 0.02,),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.emailIcon),
                  hintText: AppLocalizations.of(context)!.email,
                  controller: emailController,
                  validator: (text){
                      
                  },
                ),
               
                SizedBox(height: height * 0.02,),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.lockIcon),
                  hintText: AppLocalizations.of(context)!.password,
                  controller: passwordController,
                  suffixIcon: Image.asset(AssetsManager.eyeSlash),
                  validator: (text){
                      
                  },
                ),
                SizedBox(height: height * 0.02,),
                CustomTextField(
                  prefixIcon: Image.asset(AssetsManager.lockIcon),
                  hintText: AppLocalizations.of(context)!.re_password,
                  controller: rePasswordController,
                  suffixIcon: Image.asset(AssetsManager.eyeSlash),
                  validator: (text){
                      
                  },
                ),
                SizedBox(height: height * 0.03,),
               
                CustomElevatedButton(
                  onButtonClick: register,
                 text: AppLocalizations.of(context)!.create_account),
                SizedBox(height: height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.alreadyhaveAccount,style: 
                    AppStyles.medium16Black,),
                   
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      }, 
                      child: Text(AppLocalizations.of(context)!.login,
                      style: AppStyles.medium20Primary.copyWith(
                        decorationColor: Appcolors.primaryLight,
                        decoration: TextDecoration.underline,
                      ) ,) ),
                  ],
                ),
               
             

                
              ],
            ),
          ),
        ),
    );
  }
  void register(){

  }
}