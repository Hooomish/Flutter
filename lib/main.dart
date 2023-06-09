// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';


final List<String> list = ['assets/1.svg',
                           'assets/2.svg',
                           'assets/3.svg',
                           'assets/4.svg',
                           'assets/5.svg'];

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
              title: const Text("Flutter Demo Home Page"),
              centerTitle: true,
            ),
            body: ListView(children: <Widget>[
              SvgPicture.network('https://svgsilh.com/svg/1181528.svg'),
              CarouselSlider(
                  options: CarouselOptions(),
                  items: list
                      .map((item) => SvgPicture.asset(item))
                      .toList()
              )
            ])
        )
    );
  }
}
