import 'dart:async';

import 'package:flutter/material.dart';
import 'package:load_file/fetch_file.dart';

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
      home: MyHomePage(title: 'Load file'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController = TextEditingController();
  StreamController<String> controller = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    Stream stream = controller.stream;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: //Container(
         SingleChildScrollView(
        child: Column(
            children: [
              SafeArea(
                minimum: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.zero,
                                        bottomRight: Radius.zero,
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)
                                    ),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.black
                                    )
                                ),
                                label: Text('Test'),
                              )
                          ),
                        )
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var testFileName = searchController.text;
                          controller.add(testFileName);
                        },
                        child: Text('Найти'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    bottomLeft: Radius.zero,
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8)
                                )
                            )
                        )
                    )
                  ],
                ),
              ),
              Column(children: [
                StreamBuilder(
                    stream: stream,
                    builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
                      return FutureBuilder(
                          future: fetchFileFromAssets('assets/${streamSnapshot.data}.txt'),
                          builder: (BuildContext context, AsyncSnapshot futureSnapshot) {
                            if(futureSnapshot == null || futureSnapshot.data == null)
                              return Text("Файл не найден");
                            else
                              return Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.all(16),
                                  child: Text('${futureSnapshot.data}')
                              );
                          });
                    })
              ],)
            ])
         )
    );
  }
}
