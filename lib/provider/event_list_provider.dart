import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/event.dart';

import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/firebase_utils.dart';
import 'package:flutter_application_2/utils/toast_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EventListProvider extends ChangeNotifier {

    List<Event> eventsList = [] ;
    List<Event> filterList = [] ;
    List <String> eventNameList = [];
    int selectedIndex = 0;
    List<Event> favoriteEventsList = [];
    
    List <String> getEventNameList(BuildContext context){
      return eventNameList = [
        AppLocalizations.of(context)!.all,
        AppLocalizations.of(context)!.sport,
        AppLocalizations.of(context)!.birthday,
        AppLocalizations.of(context)!.meeting,
        AppLocalizations.of(context)!.gaming,
        AppLocalizations.of(context)!.workShop,
        AppLocalizations.of(context)!.bookClub,
        AppLocalizations.of(context)!.exhibition,
        AppLocalizations.of(context)!.holiday,
        AppLocalizations.of(context)!.eating,
        
      ];
    }

    void getAllEvents(String uId)async{
     QuerySnapshot<Event> querySnapshot = await FirebaseUtils.getEventCollection(uId).get();
     eventsList =  querySnapshot.docs.map((doc){
        return doc.data();
     }).toList() ;
     filterList = eventsList ;
     filterList.sort((event1, event2) {
       return event1.dateTime.compareTo(event2.dateTime);
     },);
     notifyListeners();
  }

  void getFilterList(String uId)async{
   var querySnapshot = await FirebaseUtils.getEventCollection(uId).
    where('eventName',isEqualTo: eventNameList[selectedIndex]).
    orderBy('dateTime').get();
     filterList =  querySnapshot.docs.map((doc){
       return doc.data() ;
     }).toList() ;
     notifyListeners();
  }
  
    void deleteEvent(String uId,String eventID, Event index)async{
      await FirebaseUtils.getEventCollection(uId).doc(eventID).delete() ;
      filterList.remove(index);
      notifyListeners() ;
    }


  void updateIsFavoriteEvents(Event event , String uId){
     FirebaseUtils.getEventCollection(uId).doc(event.id)
    .update({'isFavorite' : !event.isFavorite}).timeout(
      Duration(milliseconds: 500),onTimeout:(){
        print('updated successfully');
        ToastUtils.toastMsg(msg: 'Favorite updated successfully.',
         backgroundColor: Appcolors.greenColor,
          textColor: Appcolors.whiteColor);
         
      } 
    );
     selectedIndex == 0 ? getAllEvents(uId) : getFilterList(uId) ;

    getAllFavoriteEvents(uId);
    notifyListeners();

  }

  void getAllFavoriteEvents(String uId)async{
     var querySnapshot = await FirebaseUtils.getEventCollection(uId).where('isFavorite',isEqualTo: true)
      .orderBy('dateTime').get();
    favoriteEventsList =  querySnapshot.docs.map((doc){
            return doc.data() ;
    }).toList();
    
    notifyListeners() ;

  }

  void changeSelectedIndex(int newselectedIndex , String uId){
      selectedIndex = newselectedIndex ;
      selectedIndex == 0 ? getAllEvents(uId) : getFilterList(uId) ;
      
  }



}