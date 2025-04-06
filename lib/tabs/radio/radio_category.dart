import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/radio/data_class_radio.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class RadioCategory extends StatelessWidget {
   RadioCategory({super.key,required this.data});
   data_radio_category data ;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05 ),
      height: height * 0.14,
      width: width * 0.90,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.radioMosque),
              alignment: Alignment.bottomCenter),
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.name,
                  style: AppStyles.bold20White
                      .copyWith(color: AppColors.blackcolor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    color: AppColors.blackcolor,
                    AssetImage(AppAssets.playIconRadio),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    color: AppColors.blackcolor,
                    AssetImage(AppAssets.volumeIconRadio),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
