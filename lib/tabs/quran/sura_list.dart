import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/quran/quran_resources.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
   SuraListWidget({super.key,required this.index});
int index ;
  @override
  Widget build(BuildContext context) {
   var width =  MediaQuery.of(context).size.width ;
   var height =  MediaQuery.of(context).size.height ;
    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.vector,),
              Text('${index+1}',style: AppStyles.bold16White,),
            ],
          ),
          SizedBox(width: width * 0.04,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(QuranResources.englishQuranSurahs[index],
              style: AppStyles.bold16White.copyWith(
                fontSize: 20,
              ),),
              Text('${QuranResources.ayaNumber[index]} versus',style: AppStyles.bold14White,)
            ],
          ),
          const Spacer(),
          Text(QuranResources.arabicAuranSuras[index],style: AppStyles.bold20White,),

        ],
      ),
    );
  }
}