import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/app_bar_view.dart';
import 'package:dio/dio.dart';
import 'package:hotels/logic/hotels_logic.dart' as hotelLogic;
import 'package:hotels/views/list_view.dart';
import 'package:hotels/views/grid_view.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;

class MainView  extends StatefulWidget {
  static const routeName = '/main';

  MainView({Key? key, required this.isList, required this.isGrid}) : super(key: key);
  final bool? isList;
  final bool? isGrid;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>{
  bool isLoading = false;
  List<HotelPreview> _hotels = [];
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getHotels() async {
    setState(() {
      isLoading = true;
    });

    var hotels = await hotelLogic.getHotels(_dio);

    setState(() {
      _hotels = hotels;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : getWidget()
    );
  }

  getWidget() {
    if (widget.isList == true && widget.isGrid == false) {
      return MyListView(hotels: _hotels);
    } else if (widget.isList == false && widget.isGrid == true) {
      return MyGridView(hotels: _hotels);
    } else {
      return Container(child: Center(child: Text(Helpers.Messages.ErrorMessage)));
    }
  }
}
