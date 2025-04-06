import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentListProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void refreshMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString = prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
   mostRecentList= mostRecentIndicesAsString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }

  void updatedMostRecentIndicesList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList = prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    mostRecentIndicesList.remove('$newSuraIndex');
    mostRecentIndicesList.insert(0,'$newSuraIndex');
  }
  else{
    mostRecentIndicesList.insert(0,'$newSuraIndex');
  }
  if (mostRecentIndicesList.length > 5){
    mostRecentIndicesList.removeLast();
  }

  await prefs.setStringList(PrefKeys.mostRecentKey, mostRecentIndicesList);
}

}
