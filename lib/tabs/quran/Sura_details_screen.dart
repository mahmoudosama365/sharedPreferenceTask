import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/provider/most_recent_provider.dart';
import 'package:flutter_application_2/tabs/quran/details/sura_content.dart';
import 'package:flutter_application_2/tabs/quran/quran_resources.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});
  static const String routeName = 'sura';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostRecentListProvider provider ;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentListProvider>(context);
    if (verses.isEmpty){
      loadSuraFile(index);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            QuranResources.englishQuranSurahs[index],
            style: AppStyles.bold20Primary,
          ),
        ),
        body: Container(
          color: AppColors.blackBgColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.detailsLeftBg),
                    Text(
                      QuranResources.arabicAuranSuras[index],
                      style: AppStyles.bold24primary,
                    ),
                    Image.asset(AppAssets.detailsRightBg)
                  ],
                ),
                Expanded(
                  child: verses.isEmpty ?
                      Center(child: CircularProgressIndicator(
                        color: AppColors.primarycolor,
                      ))
                      : 
                  ListView.separated(
                    separatorBuilder: (context,index){
                        return SizedBox(height: height * 0.01 ,);
                    },
                    itemBuilder: (context, index) {
                      return SuraContent(suraContent: verses[index],index: index,);
                    },
                    itemCount: verses.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.refreshMostRecentList();
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/Suras/${index + 1}.txt');
    List<String> suralines = fileContent.split('\n');
    verses = suralines ;
    Future.delayed(Duration(seconds: 1), (){
      setState(() {
        
      });
    });
  }
}
