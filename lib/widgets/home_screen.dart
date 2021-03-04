import 'package:dog_api/model/providers/dog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dog-button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mucize Köpek"),
      ),
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (_) => DogModelClass(),
            child: DogButtonWidget(),
          ),
        ],
      ),
    );
  }
}
