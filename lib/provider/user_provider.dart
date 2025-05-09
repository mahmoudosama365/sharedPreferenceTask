import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/my_user.dart';

class UserProvider extends ChangeNotifier {
  MyUser? currentUser ;

  void updateUser(MyUser newUser){
      currentUser = newUser ;
      notifyListeners();
  }
}