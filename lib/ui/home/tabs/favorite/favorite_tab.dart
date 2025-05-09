import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/provider/user_provider.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/event_item.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/widget/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});
  @override
  Widget build(BuildContext context) {
     var userProvider = Provider.of<UserProvider>(context);
     var width = MediaQuery.of(context).size.width ;
    var height = MediaQuery.of(context).size.height ;
    var eventListProvider = Provider.of<EventListProvider>(context);
    if(eventListProvider.favoriteEventsList.isEmpty){
      eventListProvider.getAllFavoriteEvents(userProvider.currentUser!.id);
    }
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width * 0.04,
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.08,),
            CustomTextField(
              borderColor: Appcolors.primaryLight ,
              hintText: AppLocalizations.of(context)!.search_event ,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Image.asset(AssetsManager.iconSearch),
            ),
            SizedBox(height: height * 0.02,),
             Expanded(child: eventListProvider.favoriteEventsList.isEmpty ?
              Center(child: Text(AppLocalizations.of(context)!.noEventsFound),)
             : ListView.builder(
              padding: EdgeInsets.zero,
            itemBuilder: (context ,index){
              return Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                  vertical: height * 0.01,
                ),
                child: EventItem(event: eventListProvider.favoriteEventsList[index] )
              );
            },
          
            itemCount: eventListProvider.favoriteEventsList.length))
          ],
        ),
      ),
    );
  }
}