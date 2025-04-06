import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/radio/data_class_radio.dart';
import 'package:flutter_application_2/tabs/radio/radio_category.dart';

class ListReciters extends StatelessWidget {
  ListReciters({super.key});
  List<data_radio_category> dataOfReciters = [
    data_radio_category(name: 'Ibrahim Al-Akdar'),
    data_radio_category(name: 'Akram Alalaqmi'),
    data_radio_category(name: 'Majed Al-Enezi'),
    data_radio_category(name: 'Malik shaibat Alhamed'),
    data_radio_category(name: 'Al-Qaria Yassen'),
    data_radio_category(name: 'saad_alghamdi'),
    data_radio_category(name: 'zaki_daghistani'),
    data_radio_category(name: 'sahl_yassin'),
    data_radio_category(name: 'abdulrahman_alsudaes'),
    data_radio_category(name: 'ali_jaber'),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return RadioCategory(
            data: dataOfReciters[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: height * 0.017,
          );
        },
        itemCount: dataOfReciters.length);
  }
}
