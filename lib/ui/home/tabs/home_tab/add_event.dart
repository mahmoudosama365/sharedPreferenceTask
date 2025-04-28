
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/event.dart';
import 'package:flutter_application_2/provider/event_list_provider.dart';
import 'package:flutter_application_2/ui/home/home_screen.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/event_tab_item.dart';
import 'package:flutter_application_2/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter_application_2/utils/appColors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';
import 'package:flutter_application_2/utils/assets_manager.dart';
import 'package:flutter_application_2/utils/firebase_utils.dart';
import 'package:flutter_application_2/utils/toast_utils.dart';
import 'package:flutter_application_2/widget/custom_elevated_button.dart';
import 'package:flutter_application_2/widget/custom_text_field.dart';
import 'package:flutter_application_2/widget/event_date_oR_time.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});
  static const String routeName = 'add_event';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0 ;
  DateTime? selectedDate ;
  TimeOfDay? selectedTime;
  String? formatTime ;
  String selectedImage = '';
  String selectedEventName = '';
   TextEditingController titleController = TextEditingController();
      TextEditingController descriptionController = TextEditingController();
      var formKey = GlobalKey<FormState>();
     late EventListProvider eventListProvider ;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;
      eventListProvider = Provider.of<EventListProvider>(context);
     List <String> eventNameList = [
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
     List <String> imageSelectedEventList = [
      AssetsManager.sportEvent,
      AssetsManager.birthdayImage,
      AssetsManager.meetingEvent,
      AssetsManager.gamingEvent,
      AssetsManager.workShopEvent,
      AssetsManager.bookClubEvent,
      AssetsManager.exhibitionEvent,
      AssetsManager.holidayEvent,
      AssetsManager.eatingEvent,
     ];
      selectedImage = imageSelectedEventList[selectedIndex];
      selectedEventName = eventNameList[selectedIndex];
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.createEvent,
        style: AppStyles.medium20Primary,),
        
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04 ,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(imageSelectedEventList[selectedIndex]),
              ),
              SizedBox(height: height * 0.02,),
              SizedBox(
                height: height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                     return InkWell(
                      onTap: (){
                        selectedIndex = index ; 
                        setState(() {
                          
                        });
                      },
                       child: EventTabItem(
                        borderColor: Appcolors.primaryLight,
                        selectedTextStyle: AppStyles.medium16White ,
                        unSelectedTextStyle: Theme.of(context).textTheme.headlineSmall!,
                        selectedBackgroundcolor: Appcolors.primaryLight,
                        eventName: eventNameList[index],
                         isSelected: selectedIndex == index ? true : false  ),
                     );
                  },
                 separatorBuilder: (context,index){
                      return SizedBox(width:  width * 0.02 ,);
                  },
                  itemCount: eventNameList.length),
              ),
              SizedBox(height: height * 0.02,),
              Form(
                key: formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Text(AppLocalizations.of(context)!.title,
              style: AppStyles.medium16Black,),
              SizedBox(height: height * 0.01,),
              CustomTextField(
                validator: (text) {
                    if (text == null ||text.isEmpty){
                      return 'plese enter event title' ;
                    }
                    return null ;
                },
                controller: titleController,
                hintText: AppLocalizations.of(context)!.eventTitle,
                prefixIcon: IconButton(onPressed: (){},
                 icon: Image.asset(AssetsManager.noteEdit)),
              ),
              SizedBox(height: height * 0.01,),
              Text(AppLocalizations.of(context)!.description,
              style: AppStyles.medium16Black,),
              SizedBox(height: height * 0.01,),
              CustomTextField(
                validator: (text) {
                    if (text == null ||text.isEmpty){
                      return 'please enter event description' ;
                    }
                    return null ;
                },
                controller: descriptionController,
                maxLines: 4,
                hintText: AppLocalizations.of(context)!.eventDescription,
              ),
               SizedBox(height: height * 0.01,),
              EventDateortime(
                iconDateOrTime: AssetsManager.eventDateIcon,
               eventDateortime: AppLocalizations.of(context)!.eventDate,
                chooseDateortime: selectedDate == null ?
                 AppLocalizations.of(context)!.chooseDate :
                  '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                 onChooseDateOrTime: chooseDate,
              ),
              //  SizedBox(height: height * 0.01,),
              EventDateortime(
                iconDateOrTime: AssetsManager.clockIcon,
               eventDateortime: AppLocalizations.of(context)!.eventTime,
                chooseDateortime: selectedTime == null ?
                 AppLocalizations.of(context)!.chooseTime :
                  selectedTime!.format(context),
                 onChooseDateOrTime: chooseTime,
              ),
              SizedBox(height: height * 0.01,),
               Text( AppLocalizations.of(context)!.location ,
              style: AppStyles.medium16Black,),
              SizedBox(height: height * 0.01,),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width *0.02 ,
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
                        vertical:  height *0.02,
                      ),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Appcolors.primaryLight,
                ),
                child: Image.asset(AssetsManager.icomMap)
                    ),
                    SizedBox(width: width * 0.02,),
                    Text(AppLocalizations.of(context)!.chooseEventLocation,
                    style: AppStyles.medium16Primary ,),
                    Spacer(),
                    IconButton(
                      onPressed: (){},
                     icon: Icon(Icons.arrow_forward_ios_outlined, 
                     color: Appcolors.primaryLight,
                    size: 25,) ),
                       
                  ],
                ),
              ),
              SizedBox(height: height * 0.02,),
              CustomElevatedButton(
                onButtonClick: addEvent,
               text: AppLocalizations.of(context)!.addEvent),
              SizedBox(height: height * 0.02,),
                ],
              )),
              

           ],
          ),
        ),
      ),
    );
  }
 
 
  void addEvent(){
    if(formKey.currentState?.validate() == true){}
    Event event = Event(
      title: titleController.text,
     dateTime: selectedDate!,
      description: descriptionController.text,
       eventName: selectedEventName, 
       image: selectedImage,
        time: formatTime!
    ) ;
    FirebaseUtils.addEventToFireStore(event).timeout(Duration(milliseconds: 500),
     onTimeout: () {
      ToastUtils.toastMsg(msg: 'Event Added Successfully',
      backgroundColor: Appcolors.primaryLight ,
      textColor: Appcolors.whiteColor );
       print('Event added successfully. ');
       eventListProvider.getAllEvents();
      Navigator.pop(context);
      
       
     },
    ) ;
  }
   
  void showAlertdialog(){
      showDialog(context: context,
       builder: (context)=>  AlertDialog(
      title: Text('Event'),
      content: Text('Event added successfully. ',),
      contentTextStyle: AppStyles.bold16Black,
      backgroundColor: Appcolors.whiteColor ,
      actions: [
        TextButton(onPressed: (){
          Navigator.popUntil(context,ModalRoute.withName(HomeScreen.routeName),);
        },
         child: Text('Ok,',style: AppStyles.bold16Black,))
      ],
  ));
     
  }

  void chooseDate()async{
     var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
       firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = chooseDate ;
    setState(() {
      
    });
  }
  void chooseTime()async{
   var chooseTime = await showTimePicker(
      context: context,
     initialTime: TimeOfDay.now()
    );
    selectedTime = chooseTime ;
    formatTime = selectedTime!.format(context);
    setState(() {
      
    });
  }
}
