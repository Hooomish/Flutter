import 'package:json_annotation/json_annotation.dart';

part 'detailed_hotel_info.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelInformation {
  final String name;
  final String poster;
  final double rating;
  final Address address;
  final Services services;
  final List<String> photos;

  HotelInformation({
    required this.name,
    required this.poster,
    required this.rating,
    required this.address,
    required this.services,
   required this.photos
  });

  factory HotelInformation.fromJson(Map<String, dynamic> json) => _$HotelInformationFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInformationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Address {
  final String country;
  final String street;
  final String city;

  Address({required this.country, required this.street, required this.city});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Services {
  final List<String> paid;
  final List<String> free;

  Services({required this.paid, required this.free});

  factory Services.fromJson(Map<String, dynamic> json) => _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}