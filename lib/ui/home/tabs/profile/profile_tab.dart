import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/language_provider.dart';
import 'package:flutter_application_2/provider/theme_provider.dart';
import 'package:flutter_application_2/ui/home/tabs/profile/language_bottom_sheet.dart';
import 'package:flutter_application_2/ui/home/tabs/profile/theme_bottom_sheet.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    var height = MediaQuery.of(context).size.height ;
    var languageProvider = Provider.of<LanguageProvider>(context) ;
    var themeProvider = Provider.of<ThemeProvider>(context) ;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.primaryLight,
        toolbarHeight: height *0.18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46),),
        ),
        title: Row(
          children: [
            Image.asset(AssetsManager.routeImage,),
            SizedBox(width: width * 0.04,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Route Academy',style: AppStyles.bold24White,),
                Text('route@gmail.com',style: AppStyles.medium16White,),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,),
              
              InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: height*0.02),
                  padding: EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Appcolors.primaryLight,
                          width: 2,
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( languageProvider.currentLocal == 'en' ?
                        AppLocalizations.of(context)!.english :
                         AppLocalizations.of(context)!.arabic,
                        style: AppStyles.bold20Primary,),
                       const Icon(Icons.arrow_drop_down,
                        color: Appcolors.primaryLight,size: 35,)
                      ],
                    ),
                ),
              ),
              SizedBox(height: height *0.02,),
              Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,),
              InkWell(
                onTap: (){
                  showThemeBottomSheet();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: height*0.02),
                  padding: EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Appcolors.primaryLight,
                          width: 2,
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( themeProvider.currentTheme == ThemeMode.light 
                        ? AppLocalizations.of(context)!.light : 
                        AppLocalizations.of(context)!.dark ,
                        style: AppStyles.bold20Primary,),
                        const Icon(Icons.arrow_drop_down,
                        color: Appcolors.primaryLight,size: 35,)
                      ],
                    ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.redColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: width *0.06,
                    vertical: height *0.02,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
                ),
                onPressed: (){},
               child: Row(
                children: [
                  Icon(Icons.logout,color: Appcolors.whitecolor,
                  size: 25,),
                  SizedBox(width: width *0.02 ,),
                  Text(AppLocalizations.of(context)!.logout,
                  style: AppStyles.regular20White,)
                ],
               )),
              SizedBox(height: height * 0.03,)
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet(){
      showModalBottomSheet(context: context,
       builder: (context) => LanguageBottomSheet() );
  }

   void showThemeBottomSheet(){
      showModalBottomSheet(context: context,
       builder: (context) => ThemeBottomSheet());
   }
}