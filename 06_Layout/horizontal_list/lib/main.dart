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
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: Container(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                print("test ${constraints.constrainWidth()}");
                var _width = constraints.constrainWidth();
                if (_width < 500) {
                  return Container(
                      height: 400,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(color: Colors.green, padding: EdgeInsets.all(10)),
                          Container(color: Colors.red, padding: EdgeInsets.all(10)),
                          Container(color: Colors.pink, padding: EdgeInsets.all(10)),
                          Container(color: Colors.blue, padding: EdgeInsets.all(10)),
                          Container(color: Colors.orange, padding: EdgeInsets.all(10))
                        ]
                    )
                  );
                } else {
                  return Container(
                      child: GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(color: Colors.green, padding: EdgeInsets.all(10)),
                            Container(color: Colors.red, padding: EdgeInsets.all(10)),
                            Container(color: Colors.pink, padding: EdgeInsets.all(10)),
                            Container(color: Colors.blue, padding: EdgeInsets.all(10)),
                            Container(color: Colors.orange, padding: EdgeInsets.all(10))
                          ]
                      )
                  );
                }
              }
              )
      )
    );
  }
}
