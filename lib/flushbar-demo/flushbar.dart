import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Flsuhbarlarim extends StatelessWidget {

  Flushbar yokFlushbar;
  Flushbar varFlushbar;
  bool kontrol = false;

  @override
  Widget build(BuildContext context) {



    void closeTheSnack(status) {

      if (status == FlushbarStatus.SHOWING) {
        print("bar gösteriliyor ");
        if (!kontrol) {
          yokFlushbar.dismiss();
          varFlushbar = Flushbar(
            message: "İnternete bağlanıldı !",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
            flushbarPosition: FlushbarPosition.BOTTOM,
          );

          varFlushbar.show(context);
        }
      }
    }

    // SHOWİNG VE HIDING BANA YETER
    return Scaffold(
      appBar: AppBar(
        title: Text("Flushbar Demo Page"),
      ),
      body: Column(
        children: [
          Center(
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                print("Butona basıldı");

                yokFlushbar = Flushbar(
                  message: "İnternet yoktur ! ",
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 10),
                  flushbarPosition: FlushbarPosition.BOTTOM,
                  onStatusChanged: closeTheSnack,
                );

                yokFlushbar.show(context);
              },
              child: Text("Bas kanka"),
            ),
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () {
              print("Kişileeeeeeer denk değilse Sikintiiiii ");
            },
            child: Text("FlatButton 2"),
          ),
        ],
      ),
    );
  }
}
