import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/language_provider.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    var height = MediaQuery.of(context).size.height ;
    var themeProvider = Provider.of<ThemeProvider>(context) ;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
                themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.currentTheme == ThemeMode.dark ?
            getSelectedItemWidget(AppLocalizations.of(context)!.dark) 
            : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)

          ),
          SizedBox(height: height * 0.04,),
          
          InkWell(
            onTap: (){
               themeProvider.changeTheme(ThemeMode.light);
            },
            child: themeProvider.currentTheme == ThemeMode.light ?
            getSelectedItemWidget(AppLocalizations.of(context)!.light) :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
      return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Appcolors.primaryLight
                ),),
                Icon(Icons.check,size: 35,color: Appcolors.primaryLight,)
              ],
            );
  }
  Widget getUnSelectedItemWidget(String text){
      return Text(text,
            style: Theme.of(context).textTheme.headlineMedium
            );
  }
}