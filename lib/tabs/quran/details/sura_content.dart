import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  SuraContent({super.key, required this.suraContent,
  required this.index});
  String suraContent;
  int index ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    return Container(
      margin: EdgeInsets.only(top: height *0.02),
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primarycolor,
          width: 2 ,
        )
      ),
      child: Text(
        '${suraContent}[${index+1}]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyles.bold20Primary,
      ),
    );
  }
}
