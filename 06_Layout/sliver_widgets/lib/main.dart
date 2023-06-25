import 'package:flutter/material.dart';
import 'dart:math';

class User {
  late int age;
  late String name;
  User(this.age, this.name);
}

var users = <User>[User(25, 'Nastya'),
  User(16, 'Masha'),
  User(20, 'Inessa'),
  User(40, 'Raisa'),
  User(50, 'Igor'),
  User(13, 'Barsik')];

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver Grid App"),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                        if(index >= users.length)
                          return null;
                        return Container(
                          alignment: Alignment.center,
                          color: Color.fromRGBO(
                            Random().nextInt(255),
                            Random().nextInt(255),
                            Random().nextInt(255),
                            1,
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(users[index].name),
                              Text("Age: ${users[index].age}")
                            ],
                          )
                        );
                      }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              )
          )
        ],
      ),
    );
  }
}
