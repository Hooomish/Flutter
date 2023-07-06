import 'package:albums_route/home_page.dart';
import 'package:albums_route/albums_page.dart';
import 'package:albums_route/description_page.dart';
import 'package:albums_route/not_found_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context){
          return NotFoundPage();
        });
      },
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return MyHomePage();
            });
            break;
          case AlbumsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return AlbumsPage();
            });
            break;
          case AlbumsDescriptionPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;
            print(args);

            if (args != null && args.containsKey('name') && args.containsKey('about')) {
              return MaterialPageRoute(builder: (BuildContext context) {
                return AlbumsDescriptionPage(name: args['name'], about: args['about'],);
              });
            }
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFoundPage();
            });
            break;
        }
      }
    );
  }
}



