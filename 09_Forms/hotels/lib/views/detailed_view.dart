import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;
import 'package:hotels/models/detailed_hotel_info.dart';

class DetailedView extends StatefulWidget {
  static const routeName = '/details';
  final String? uuid;

  DetailedView({Key? key, required this.uuid}) : super(key: key);

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  Dio _dio = Dio();
  late HotelInformation? hotel = null;
  bool hasError = false;
  bool isLoading = false;
  late String errorMessage;

  getDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _dio.get('${Helpers.Urls.GettingHotelByUuidUrl}${widget.uuid}');
      var data = HotelInformation.fromJson(response.data);

      setState(() {
        hotel = data;
        isLoading = false;
      });
    } on DioException catch (e) {
      errorMessage = e.response?.data['message'];

      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isLoading == true || hasError == true
            ? AppBar()
            : AppBar(title: Text(hotel!.name), centerTitle: true),
        body: isLoading == true && hotel == null
            ? Center(child: CircularProgressIndicator())
              : hasError
              ? Center(child: Text('$errorMessage'))
              : ListView(
                children: [
                  CarouselSlider(
                      items: hotel!.photos.map((photo) => Image.asset('${Helpers.Paths.ImagesPath}$photo', fit: BoxFit.cover,)).toList(),
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height/3
                      )
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: Helpers.Style.Padding, top: Helpers.Style.Padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DetailedHotelInformation(text: '${Helpers.Keys.Country}: ', boldText: '${hotel!.address.country}'),
                          DetailedHotelInformation(text: '${Helpers.Keys.City}: ', boldText: '${hotel!.address.city}'),
                          DetailedHotelInformation(text: '${Helpers.Keys.Street}: ', boldText: '${hotel!.address.street}'),
                          DetailedHotelInformation(text: '${Helpers.Keys.Rating}: ', boldText: '${hotel!.rating}')
                        ],
                      )
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: Helpers.Style.Padding*2, left: Helpers.Style.Padding),
                      child: Text('${Helpers.Keys.Services}', style: TextStyle(fontSize: Helpers.Style.ServicesKeyFontSize))
                  ),
                  Container(
                    padding: EdgeInsets.only(left: Helpers.Style.Padding, top:Helpers.Style.Padding),
                    child: Row(
                      children: [
                        Expanded(child: Text('${Helpers.Keys.Paid}', style: TextStyle(fontSize: Helpers.Style.ServiceTypesKeyFontSize),)),
                        Expanded(child: Text('${Helpers.Keys.Free}', style: TextStyle(fontSize: Helpers.Style.ServiceTypesKeyFontSize)))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:Helpers.Style.Padding, left: Helpers.Style.Padding, bottom: Helpers.Style.Padding*2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: hotel!.services.paid.map((service) => Text('$service')).toList()
                                )
                            )
                        ),
                        Expanded(
                            child: Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: hotel!.services.free.map((service) => Text('$service')).toList()
                                )
                            )
                        )
                      ],
                    ),
                  ),
                ]
        )
    );
  }
}

class DetailedHotelInformation extends StatelessWidget {
  late final String text;
  late final String boldText;

  DetailedHotelInformation({Key? key, required this.text, required this.boldText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: Helpers.Style.Padding),
        child: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan> [
                  TextSpan(text: '$text'),
                  TextSpan(text: '$boldText', style: TextStyle(fontWeight: FontWeight.bold))
                ]
            )
        )
    );
  }
}