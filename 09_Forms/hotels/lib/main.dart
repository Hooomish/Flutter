import 'package:flutter/material.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/main_view.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;
import 'package:hotels/views/detailed_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeView.routeName,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomeView.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return HomeView();
            });
          case MainView.routeName:
            final args = settings.arguments as Map<String, bool>;

            return MaterialPageRoute(builder: (BuildContext context) {
              return MainView(isList: args[Helpers.Keys.ListKey], isGrid: args[Helpers.Keys.GridKey]);
            });
          case DetailedView.routeName:
            final args = settings.arguments as Map<String, String>;

            return MaterialPageRoute(builder: (BuildContext context) {
              return DetailedView(uuid: args[Helpers.Keys.Uuid]);
            });
        }
      },
    );
  }
}
