import 'package:flutter/material.dart';

class AlbumsDescriptionPage extends StatefulWidget {
  static const routeName = '/description';

  AlbumsDescriptionPage({Key? key, required this.name, required this.about}) : super(key: key);
  final String name;
  final String about;

  @override
  _AlbumsDescriptionPageState createState() => _AlbumsDescriptionPageState();
}

class _AlbumsDescriptionPageState extends State<AlbumsDescriptionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView (
          child: Text(widget.about)
      ),
    );
  }
}