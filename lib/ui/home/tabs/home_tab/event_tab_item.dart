import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class EventTabItem extends StatelessWidget {
   EventTabItem({super.key ,required this.eventName,
  required this.isSelected,required this.selectedBackgroundcolor,
  required this.selectedTextStyle,required this.unSelectedTextStyle,
  this.borderColor});
   String eventName ;
   bool isSelected ;
   Color? selectedBackgroundcolor;
   TextStyle selectedTextStyle ;
   TextStyle unSelectedTextStyle ;
   Color? borderColor ;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width *0.01),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical:  height *0.01),
      decoration: BoxDecoration(
       color:  isSelected ?
           selectedBackgroundcolor : Appcolors.transparentColor,
        borderRadius:  BorderRadius.circular(46),
        border: Border.all(
          color: borderColor ?? Appcolors.whiteColor,
          width: 1,
        ),
      ),
      child: Text(eventName,
      style: isSelected ? selectedTextStyle 
      : unSelectedTextStyle  ,),
    );
  }
}