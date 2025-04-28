import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({super.key,required this.onButtonClick,
   required this.text});
    Function onButtonClick ;
    String text ;
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical:  height * 0.01 ,
          
        ),
        backgroundColor: Appcolors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: (){
        onButtonClick();
      },
     child: Text(text, style: AppStyles.medium20White ,),
     );
  }
}