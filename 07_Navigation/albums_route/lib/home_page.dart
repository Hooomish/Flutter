import 'package:albums_route/albums_page.dart';
import 'package:flutter/material.dart';

class Menu {
  String name;
  String routeName;

  Menu({required this.name, required this.routeName});
}


class MyHomePage extends StatefulWidget {
  static const routeName = '/';

  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSelected = 0;

  static final List<Menu> _listViewData = [
    new Menu(name: "Home", routeName: MyHomePage.routeName),
    new Menu(name: "Albums", routeName: AlbumsPage.routeName)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page')
      ),
      drawer: Drawer(
        child: Container(
            child: SafeArea(
              child: ListView.builder(
                  itemCount: _listViewData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        title: Text(_listViewData.map((item) => item.name).toList()[index]),
                        textColor: _currentSelected == index ? Colors.blue : Colors.black,
                        onTap: () {
                          setState(() {
                            _currentSelected = index;
                          });
                          Navigator.of(context).pushNamed(_listViewData.map((item) => item.routeName).toList()[index]);
                          },
                      ),
                    );
                  }
              ),
            )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home page',
            ),
          ],
        ),
      ),
    );
  }
}