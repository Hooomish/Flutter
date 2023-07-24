import 'package:hotels/models/hotel.dart';
import 'package:dio/dio.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;


getHotels(Dio dio) async {
  final response = await dio.get(Helpers.Urls.GettingAllHotelsUrl);
  var hotels = response.data.map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel)).toList();

  return hotels;
}