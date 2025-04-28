import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/event.dart';
import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
   EventItem({super.key,required this.event});
  Event event ;
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
     var eventListProvider = Provider.of<EventListProvider>(context);
    return Container(
      height: height * 0.31 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Appcolors.primaryLight,
          width: 1,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
          event.image))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02 ,
              vertical:  height * 0.01 ,
            ),
            padding: EdgeInsets.symmetric(
              horizontal:  width * 0.02,
              vertical:  height * 0.001
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Appcolors.whiteColor
            ),
            child: Column(
              children: [
                Text(event.dateTime.day.toString(),style:AppStyles.bold20Primary ,),
                 Text(DateFormat('MMM').format(event.dateTime),style:AppStyles.bold20Primary ,)
              ],
            ),
          ),
           Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02 ,
              vertical:  height * 0.01 ,
            ),
            padding: EdgeInsets.symmetric(
              horizontal:  width * 0.02,
              vertical:  height * 0.001
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Appcolors.whiteColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(event.title,
                  style: Theme.of(context).textTheme.bodyLarge ,),
                ),
                IconButton(onPressed: (){
                  eventListProvider.updateIsFavoriteEvents(event);
                },
                 icon: Image.asset(
                  event.isFavorite == true ?
                  AssetsManager.selectedfavoriteIcon:
                  AssetsManager.unSelectedFavoriteIcon),),
                
              ],
            ),
          )
       
        ],
      ),
    );
  }
}