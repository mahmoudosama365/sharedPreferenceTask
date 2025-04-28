import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class EventDateortime extends StatelessWidget {
   EventDateortime({super.key,required this.iconDateOrTime,
   required this.eventDateortime,required this.chooseDateortime,
   required this.onChooseDateOrTime});
    String iconDateOrTime ;
   String eventDateortime ;
   String chooseDateortime ;
   Function onChooseDateOrTime ;
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
    return Row(
      children: [
          Image.asset(iconDateOrTime),
          SizedBox(width:  width * 0.02,),
          Expanded(child: Text(eventDateortime,style: AppStyles.medium16Black,)),
          TextButton(
            onPressed: (){
                onChooseDateOrTime();
            },
           child: Text(chooseDateortime,style: AppStyles.medium16Primary,)),

      ],
    );
  }
}