import 'package:flutter/services.dart';
import 'package:albums_route/albums_page.dart';
import 'dart:convert';

Future<List<Album>> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) => json.decode(file).map<Album>(Album.fromJson).toList());
}
