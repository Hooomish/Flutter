import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hotels/logic/helpers.dart' as Helpers;
import 'package:hotels/views/main_view.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';

  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushNamed(MainView.routeName, arguments: {Helpers.Keys.ListKey: true, Helpers.Keys.GridKey: false});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(Helpers.Keys.Hotels),
      ),
    );
  }
}
