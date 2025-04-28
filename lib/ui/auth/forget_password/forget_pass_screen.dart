import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/widget/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});
  static const String routeName = 'ForgetPass' ;
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Appcolors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.forget_password,
        style: AppStyles.medium20Black,) ,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width * 0.04,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManager.forgetPasswordimg),
            SizedBox(height: height * 0.02 ,),
            CustomElevatedButton(onButtonClick: (){},
             text: AppLocalizations.of(context)!.resetPassword)
          ],
        ),
      ),
    );
  }
}