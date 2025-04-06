import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/radio/list_radio.dart';
import 'package:flutter_application_2/tabs/radio/list_reciters.dart';
import 'package:flutter_application_2/tabs/radio/radio_category.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_colors.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class Radiotab extends StatefulWidget {
  Radiotab({super.key});

  @override
  State<Radiotab> createState() => _RadiotabState();
}

class _RadiotabState extends State<Radiotab> {
  int select = 1;
  List <Widget> listOfReciters_Radio = [ListRadio(),ListReciters()];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.009),
          alignment: Alignment.center,
          width: width * 0.90,
          height: height * 0.05,
          decoration: BoxDecoration(
            color: AppColors.blackBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  select = 1;
                  setState(() {

                  });
                },
                child: select == 1
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primarycolor,
                        ),
                        height: height * 0.05,
                        child: Text('Radio',
                            style: AppStyles.bold16Black,
                            textAlign: TextAlign.center),
                      )
                    : Text('Radio',
                        style: AppStyles.bold16White,
                        textAlign: TextAlign.center),
              )),
              Expanded(
                  child: InkWell(
                onTap: () {
                   select = 2 ;
                   setState(() {
                     
                   });
                },
                child: select == 2
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primarycolor,
                        ),
                        height: height * 0.05,
                        child: Text('Reciters',
                            style: AppStyles.bold16Black,
                            textAlign: TextAlign.center),
                      )
                    : Text(
                        'Reciters',
                        style: AppStyles.bold16White,
                        textAlign: TextAlign.center,
                      ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Expanded(
            child: select == 1 ? listOfReciters_Radio[0] : 
                  listOfReciters_Radio[1]  ),
        SizedBox(
          height: height * 0.017,
        )
      ],
    );
  }
}
