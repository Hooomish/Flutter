import 'package:flutter/material.dart';
import 'package:albums_route/fetch_file.dart';

class Album {
  String name;
  String link;
  String about;

  Album({required this.name, required this.link, required this.about});

  static Album fromJson(json) => Album(
      name: json['name'],
      link: json['link'],
      about: json['about']
  );
}

class AlbumsPage extends StatefulWidget {
  static const routeName = '/albums';

  AlbumsPage({Key? key}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: FutureBuilder<List<Album>>(
          future: fetchFileFromAssets('assets/artists.json'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator()
                );
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(snapshot.data[index].name),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/description',
                              arguments: {'name':snapshot.data[index].name, 'about':snapshot.data[index].about}
                            );
                          }
                      );
                    });
              default:
                return Center(
                    child: CircularProgressIndicator()
                );
            }
          }
      )
    );
  }
}