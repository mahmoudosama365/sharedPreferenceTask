import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/hadeth/hadeth_item.dart';

class Hadethtab extends StatelessWidget {
  const Hadethtab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: height * 0.65,
      ),
      items: List.generate(50,(index)=>index+1).map((i) {
        return HadethItem(index: i,);
        
      }).toList(),
    );
  }
}
