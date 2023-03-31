import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String assetName = 'assets/1.svg';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Home Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Demo Home Page"),
              centerTitle: true,
            ),
            body: Column(children: <Widget>[
              SvgPicture.asset(assetName),
            ])
        ));
  }
}

