import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/most_recent_provider.dart';
import 'package:flutter_application_2/tabs/quran/Sura_details_screen.dart';
import 'package:flutter_application_2/tabs/quran/most_recent_widget.dart';
import 'package:flutter_application_2/tabs/quran/quran_resources.dart';
import 'package:flutter_application_2/tabs/quran/sura_list.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';


class Qurantab extends StatefulWidget {
   Qurantab({super.key});

  @override
  State<Qurantab> createState() => _QurantabState();
}

class _QurantabState extends State<Qurantab> {
  List <int> filterIndicesList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<MostRecentListProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newtext) {
              filterListByNewText(newtext);
            },
            style: AppStyles.bold20White,
            cursorColor: AppColors.primarycolor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primarycolor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.primarycolor,
                    width: 2,
                  ),),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.iconsearch),
                color: AppColors.primarycolor,
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          
          MostRecentWidget(),
         
           SizedBox(
            height: height * 0.01,
          ),
          Text(
            'Suras List',
            style: AppStyles.bold16White,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      provider.updatedMostRecentIndicesList(filterIndicesList[index]);
                      Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                       arguments: filterIndicesList[index] );
                    },
                    child: SuraListWidget(index: filterIndicesList[index],));
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.whitecolor,
                    thickness: 2,
                    indent: width * 0.09 ,
                    endIndent: width * 0.05 ,
                  );
                },
                itemCount: filterIndicesList.length),
          ),
        ],
      ),
    );
  }

  void filterListByNewText(String newtext){
      List <int> filterList = [];
      for(int i=0; i<QuranResources.englishQuranSurahs.length;i++){
        if (QuranResources.englishQuranSurahs[i].toLowerCase().contains(newtext.toLowerCase())){
          filterList.add(i);
        }
        else if (QuranResources.arabicAuranSuras[i].contains(newtext)){
          filterList.add(i);
        }
        filterIndicesList = filterList;
        setState(() {
          
        });
      }
  }
}
