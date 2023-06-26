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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            forceElevated: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver Grid App"),
              background: Image.network("https://loremflickr.com/320/240", fit: BoxFit.cover ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                        return Text("bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla "
                            "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla "
                            "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla "
                            "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla "
                            "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ");
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
