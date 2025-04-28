import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/event.dart';
import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/event_item.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/event_tab_item.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/utils/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
 
  

  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    if (eventListProvider.eventsList.isEmpty){
       eventListProvider.getAllEvents();
    }
    var height = MediaQuery.of(context).size.height ;
     var width = MediaQuery.of(context).size.width ;
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: AppStyles.regular14White,
                ),
                Text(
                  AppLocalizations.of(context)!.routeAcademy,
                  style: AppStyles.bold24White,
                ),
              ],
            ),
            Spacer(),
            Image.asset(AssetsManager.sunIcon,
            color: Appcolors.whiteColor,),
            SizedBox(width: width * 0.02,),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02 ,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Appcolors.whiteColor,
              ),
              child: Text('EN',style: AppStyles.bold14Primary,),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.13,
            padding: EdgeInsets.symmetric(
              horizontal: width *0.02 ,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Theme.of(context).primaryColor
            ),
            child: Column(
              children: [
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Image.asset(AssetsManager.icomMap),
                    SizedBox(width: width *0.01,),
                    Text('Cairo, Egypt',style: AppStyles.medium14White,),
                  ],
                ),
                SizedBox(height: height *0.01,),
                DefaultTabController(
                  length: eventListProvider.eventNameList.length,
                 child: TabBar(
                  onTap: (index){
                     eventListProvider.changeSelectedIndex(index);
                  },
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: Appcolors.transparentColor,
                  dividerColor: Appcolors.transparentColor,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: eventListProvider.eventNameList.map((eventName){
                    return EventTabItem(
                      selectedTextStyle: Theme.of(context).textTheme.headlineSmall! ,
                      unSelectedTextStyle: AppStyles.medium16White ,
                      
      
                      selectedBackgroundcolor: Theme.of(context).focusColor,
                      eventName: eventName,
                     isSelected: eventListProvider.selectedIndex == eventListProvider.eventNameList.indexOf(eventName));
                  }).toList()
                  
                 ),
                 ),
              ],
            ),
          ),
          Expanded(child:eventListProvider.filterList.isEmpty 
          ? Center(child: Text(AppLocalizations.of(context)!.noEventsFound,
          style: AppStyles.medium16Black,),)
          : ListView.builder(
            itemBuilder: (context ,index){
              return Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02
                ),
                child: EventItem(event: eventListProvider.filterList[index],),
              );
            },
          
            itemCount: eventListProvider.filterList.length)),
        ],
      ) ,
    );
  }

}
