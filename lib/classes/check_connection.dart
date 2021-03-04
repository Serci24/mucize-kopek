import 'dart:io';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class InternetConnection {

  Flushbar olumsuz = Flushbar(
      message: "İnternet yoktur ! ",
      backgroundColor: Colors.red,
      duration: Duration(seconds: 10),
      flushbarPosition: FlushbarPosition.BOTTOM,
    );

  
  Future internetCheck() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }
}