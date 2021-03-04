import 'package:flutter/material.dart';

class DogModelClass with ChangeNotifier{
  void onPress(){
    notifyListeners();
  }
}