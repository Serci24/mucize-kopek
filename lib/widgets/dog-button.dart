import 'dart:convert';

import 'package:dog_api/model/http_models/dog.dart';
import 'package:dog_api/model/providers/dog_provider.dart';
import 'package:dog_api/classes/check_connection.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DogButtonWidget extends StatelessWidget {
  var internetBaglantisi = InternetConnection();
  var flushbar = InternetConnection().olumsuz;

  @override
  Widget build(BuildContext context) {
    var myDogProv = Provider.of<DogModelClass>(context);
    print("builder tetiklendi ! ");

    Future<dynamic> getPic() async {
      try {
        var response =
            await http.get("https://dog.ceo/api/breeds/image/random");
        if (response.statusCode == 200) {
          var decoeddedJson = jsonDecode(response.body);
          var parsedJson = Dog.fromJson(decoeddedJson);
          return parsedJson;
        }
      } catch (err) {
        print(err);
      }
    }

    getPic();

    Widget futureBuilderChild(snapShot) {
      if (snapShot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  "Resminiz Getiriliyor Lütfen Bekleyin !",
                ),
              )
            ],
          ),
        );
      } else if (snapShot.hasData) {
        return Image.network(
          snapShot.data.message,
          fit: BoxFit.contain,
          height: 400,
          width: 300,
        );
      } else if (snapShot.connectionState == ConnectionState.done) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    "İNTERNET BAĞLANTINIZ YOK",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return Center(
          child: Text("Bilinmeyen bir hatayla karşılaşıldı..."),
        );
      }
    }

    return Column(
      children: [
        FutureBuilder(
          future: getPic(),
          builder: (context, snapShot) {
            return Center(
              child: Container(
                height: 400,
                width: 300,
                child: futureBuilderChild(snapShot),
              ),
            );
          },
        ),
        RaisedButton(
          color: Colors.tealAccent,
          child: Text("Yeni köpek"),
          onPressed: () {
            getPic();
            internetBaglantisi.internetCheck().then((value) => {
                if (value == false) {
                      flushbar.show(context),
                    }
                  else {
                      flushbar.dismiss(),
                    }
                });
            myDogProv.onPress();
          },
        ),
      ],
    );
  }
}
