// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_hotel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInformation _$HotelInformationFromJson(Map<String, dynamic> json) =>
    HotelInformation(
      name: json['name'] as String,
      poster: json['poster'] as String,
      rating: (json['rating'] as num).toDouble(),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      services: Services.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelInformationToJson(HotelInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'poster': instance.poster,
      'rating': instance.rating,
      'address': instance.address.toJson(),
      'services': instance.services.toJson(),
      'photos': instance.photos,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
    };

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      paid: (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
      free: (json['free'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'paid': instance.paid,
      'free': instance.free,
    };
