import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/utils/app_styles.dart';

class Sebhatab extends StatefulWidget {
  Sebhatab({super.key});

  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  List<String> listForSebha = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا اله الا الله',
    '....'
  ];

  int number = 0;
  double angle = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.03),
          child: Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: AppStyles.bold36white,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        SizedBox(
          width: width * 0.88,
          height: height * 0.49,
          child: GestureDetector(
            onTap: () {
                  number += 1;
                   angle += 0.1;
                   if (index > 3){
                    index = 0 ;
                  }
                  
                    if (number == 33) {
                      angle = 0 ;
                      number = 0;
                      index += 1;
                    }
                    setState(() {
                      
                    });
                  
                },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                   padding: EdgeInsets.only(top: height * 0.04),
                  child: Transform.rotate(
                    alignment: Alignment.center,
                      angle: angle,
                      child: Image.asset(AppAssets.sebhaBody)),
                ),
                Text(
                  listForSebha[index],
                  style: AppStyles.bold36white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.18),
                  child: Text(
                    '$number',
                    style: AppStyles.bold36white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
