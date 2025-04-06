import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/most_recent_provider.dart';
import 'package:flutter_application_2/tabs/quran/quran_resources.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
   MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  List<int> mostRecentList = [] ;
  late MostRecentListProvider provider ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
        provider.refreshMostRecentList();
    });
    
  }
 
  

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;
     provider = Provider.of<MostRecentListProvider>(context) ;
    return Visibility(
      visible: provider.mostRecentList.isNotEmpty ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
              'Most Recently ',
              style: AppStyles.bold16White,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: double.infinity,
              height: height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * 0.03,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: width * 0.80,
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primarycolor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02, horizontal: width * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                QuranResources.englishQuranSurahs[provider.mostRecentList[index]],
                                style: AppStyles.bold22Black,
                              ),
                              Text(QuranResources.arabicAuranSuras[provider.mostRecentList[index]]
                              , style: AppStyles.bold22Black),
                              Text('${QuranResources.ayaNumber[provider.mostRecentList[index]]} Verses', style: AppStyles.bold14Black),
                            ],
                          ),
                        ),
                        Image.asset(AppAssets.mostRecentlyimage),
                      ],
                    ),
                  );
                },
                itemCount: provider.mostRecentList.length,
              ),
            ),
          
        ],
      ),
    );
  }
}