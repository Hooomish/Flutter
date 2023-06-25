import 'package:flutter/material.dart';

const double textSize = 52;
const double space = 15;

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
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(users[index].name),
                Text("Возраст: ${users[index].age}")
              ],
            )
          );
        },
      ),
    );
  }
}
