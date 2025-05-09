import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/home/home_screen.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class DialogUtils {

  static void showLoading({required BuildContext context, required String message}){
      showDialog(context: context,
      barrierDismissible: false,
       builder: (context)=>  AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message,style: AppStyles.medium16Black,),
          ),
        ],
      ),
     
  ));
     
  }

  static void hideLoading(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessage({required BuildContext context,
  required String message, String? title,
  String? posActionName,
  Function? posAction,
   String? negActionName,
  Function? negAction, 
   }){
    List <Widget> actions = [];
      showDialog(context: context,
       builder: (context){
        if (posActionName != null ){
          actions.add(TextButton(onPressed: (){
              Navigator.pop(context);


              posAction?.call() ;
          },
           child: Text(posActionName,
           style: AppStyles.medium16Black,)));
        }
        if (negActionName != null ){
          actions.add(TextButton(onPressed: (){
              Navigator.pop(context);


              negAction?.call() ;
          },
           child: Text(negActionName,
           style: AppStyles.medium16Black,)));
        }
          return AlertDialog(
            content: Text(message,
            style: AppStyles.medium16Black,),
            title: Text(title ?? '',style: AppStyles.medium16Black,),
            actions: actions,
          );
       });
  }



}