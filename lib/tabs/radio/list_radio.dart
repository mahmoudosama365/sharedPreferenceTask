import 'package:flutter/material.dart';
import 'package:flutter_application_2/tabs/radio/data_class_radio.dart';
import 'package:flutter_application_2/tabs/radio/radio_category.dart';

class ListRadio extends StatelessWidget {
   ListRadio({super.key});
  List <data_radio_category> dataOfRadio = [
    data_radio_category(name: 'Radio Ibrahim Al-Akdar'),
    data_radio_category(name: 'Radio Al-Qaria Yassen'),
    data_radio_category(name: 'Radio Ahmed Al-trabulsi'),
    data_radio_category(name: 'Radio Addokali Mohammad Alalim'),
    data_radio_category(name: 'Radio Akram Alalaqmi'),
    data_radio_category(name: 'Radio saad_alghamdi'),
    data_radio_category(name: 'Radio zaki_daghistani'),
    data_radio_category(name: 'Radio sahl_yassin'),
    data_radio_category(name: 'Radio abdulrahman_alsudaes'),
    data_radio_category(name: 'Radio ali_jaber'),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return RadioCategory(data: dataOfRadio[index] ,);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.017,
                  );
                },
                itemCount: dataOfRadio.length);
  }
}