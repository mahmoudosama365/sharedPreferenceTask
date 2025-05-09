
import 'package:flutter/material.dart';

import 'package:flutter_application_2/model/event.dart';

import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/provider/user_provider.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/add_event.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/utils/firebase_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditDetails extends StatefulWidget {
  EditDetails({super.key});
  static const String routeName = 'edit';

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  var userProvider;
  

  @override
  Widget build(BuildContext context) {
     var eventListProvider = Provider.of<EventListProvider>(context);
    var arguments =
        ModalRoute.of(context)?.settings.arguments as Event ;
    Event index = arguments;
   
     Event event = index ;
    String dateTime =
        DateFormat('d MMMM yyyy', 'en').format(event.dateTime);
    print(dateTime);
    

   var userProvider = Provider.of<UserProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Event details',
          style: AppStyles.medium20Primary,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddEvent.routeName,);
              },
              padding: EdgeInsets.only(left: width * 0.07),
              icon: Icon(Icons.edit)),
          IconButton(onPressed: () {
            eventListProvider.deleteEvent(userProvider.currentUser!.id,
             event.id,index);
            
            Navigator.pop(context);
          }, icon: Icon(Icons.delete_outlined)),
          //  SizedBox(width: width * 0.015,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: Image.asset(event.image)),
              SizedBox(
                  child: Text(
                event.title,
                style: AppStyles.medium24Primary,
              )),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.008,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Appcolors.primaryLight,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.02,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Appcolors.primaryLight,
                      ),
                      child: Image.asset(AssetsManager.calendarIcon),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateTime,
                          style: AppStyles.medium16Primary,
                        ),
                        Text(
                          event.time,
                          style: AppStyles.medium16Black,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.008,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Appcolors.primaryLight,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                          vertical: height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Appcolors.primaryLight,
                        ),
                        child: Image.asset(AssetsManager.icomMap)),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      'Cairo, Egypt',
                      style: AppStyles.medium16Primary,
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Appcolors.primaryLight,
                          size: 25,
                        )),
                  ],
                ),
              ),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                  ),
                  child: Image.asset(AssetsManager.iconSelectedMap)),
              Text(
                'Description',
                style: AppStyles.medium16Black,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                event.description,
                style: AppStyles.medium16Black,
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
