import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/my_user.dart';
import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/provider/user_provider.dart';
import 'package:flutter_application_2/ui/auth/login/login_screen.dart';
import 'package:flutter_application_2/ui/home/home_screen.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/utils/dialog_utils.dart';
import 'package:flutter_application_2/utils/firebase_utils.dart';
import 'package:flutter_application_2/widget/custom_elevated_button.dart';
import 'package:flutter_application_2/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});
  static const String routeName = 'register' ;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController(text: 'mahmoud@route.com' );

  TextEditingController passwordController = TextEditingController(text: '123456' );

  TextEditingController rePasswordController = TextEditingController(text: '123456' );

  TextEditingController nameController = TextEditingController(text: 'mahmoud' );

  var formKey = GlobalKey<FormState>() ;

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
            child: Form(
              key: formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  Image.asset(AssetsManager.loginLogo,height: height * 0.20,),
                  SizedBox(height: height * 0.02,),
                   
                  CustomTextField(
                    prefixIcon: Image.asset(AssetsManager.nameIcon),
                    hintText: AppLocalizations.of(context)!.name,
                    controller: nameController,
                    validator: (text){
                         if (text == null ||text.trim().isEmpty){
                          return 'Please enter name' ;
                        }
                          return null ;
                    },
                  ),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    prefixIcon: Image.asset(AssetsManager.emailIcon),
                    hintText: AppLocalizations.of(context)!.email,
                    keyboardInputType: TextInputType.emailAddress,
                    
                    controller: emailController,
                    validator: (text){
                         if (text == null ||text.trim().isEmpty){
                          return 'Please enter email' ;
                        }
                        final bool emailValid = 
                           RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                        if (!emailValid){
                          return 'Please enter valid email' ;
                        }
                        return null ;
                    },
                  ),
                 
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    prefixIcon: Image.asset(AssetsManager.lockIcon),
                    hintText: AppLocalizations.of(context)!.password,
                    controller: passwordController,
                    obscureText: true,
                    suffixIcon: Image.asset(AssetsManager.eyeSlash),
                    validator: (text){
                        if (text == null||text.trim().isEmpty){
                             return 'Please enter password' ;
                          }
                          if(text.length < 6){
                             return 'Password length should be at least 6 characters' ;
                          }
                        return null ;
                    },
                  ),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    prefixIcon: Image.asset(AssetsManager.lockIcon),
                    hintText: AppLocalizations.of(context)!.re_password,
                    controller: rePasswordController,
                    obscureText: true,
                    keyboardInputType: TextInputType.number ,
                    suffixIcon: Image.asset(AssetsManager.eyeSlash),
                    validator: (text){
                          if (text == null||text.trim().isEmpty){
                             return 'Please enter re-password' ;
                          }
                          if(text.length < 6){
                             return 'Password length should be at least 6 characters' ;
                          }
                          if (text != passwordController.text){
                              return 'Re-Password does not match password ' ;
                          }
              
                        return null ;
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
        ),
    );
  }

  void register()async{
      if (formKey.currentState?.validate() == true){
        DialogUtils.showLoading(context: context,
         message: 'Loading...');
    try {
         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text,
      );

      MyUser myUser = MyUser(id: credential.user?.uid ?? '',
       name: nameController.text, email: emailController.text) ;
      await FirebaseUtils.addUserToFireStore(myUser);
      var userProvider = Provider.of<UserProvider>(context,listen: false);
        userProvider.updateUser(myUser);
      var eventListProvider = Provider.of<EventListProvider>(context,listen: false);
        eventListProvider.changeSelectedIndex(0, userProvider.currentUser!.id );
      DialogUtils.hideLoading;
      DialogUtils.showMessage(context: context,
      message: 'RegisterSuccessfully.',title: 'Success',posActionName: 'Ok',
      posAction: (){
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      });
        print('Register successfully');
        print(credential.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      DialogUtils.hideLoading;
      DialogUtils.showMessage(context: context,
      message: 'The password provided is too weak.',
      title: 'Error',posActionName: 'Ok');
      print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       DialogUtils.hideLoading;
      DialogUtils.showMessage(context: context,
      message: 'The account already exists for that email.',
      title: 'Error',posActionName: 'Ok');
      print('The account already exists for that email.');
    }
  }  catch (e) {
     DialogUtils.hideLoading;
      DialogUtils.showMessage(context: context,
      message: 'The account already exists for that email.',
      title: 'Error',posActionName: 'Ok');
    print(e.toString());
   }  
}
  }
}