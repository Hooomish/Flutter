import 'package:flutter/material.dart';

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
  User(13, 'Barsik'),
  User(25, 'Nastya'),
  User(16, 'Masha'),
  User(20, 'Inessa'),
  User(40, 'Raisa'),
  User(50, 'Igor'),];

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
  var listData = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    children: [
                      Text(users[index].name),
                      Text("Age: ${users[index].age}")
                    ]
                )
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: users.length
      )
    );
  }
}
