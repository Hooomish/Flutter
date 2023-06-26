import 'package:flutter/material.dart';

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
      // appBar: AppBar(
      //   title: Text('Text field styled'),
      // ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(decoration: InputDecoration(
                labelText: "Search",
                hintText: "Введите значение",
                helperText: "Поле для поиска заметок",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                suffixIcon: Icon(Icons.search)
            ),
            ),
          ],
        ),
      ),
    );
  }
}
