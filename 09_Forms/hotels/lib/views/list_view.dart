import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;
import 'package:hotels/views/detailed_view.dart';

class MyListView extends StatefulWidget {
  MyListView({Key? key, required this.hotels}) : super(key: key);
  List<HotelPreview> hotels;

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.hotels.length,
        itemBuilder: (context, index) {
          var hotel = widget.hotels[index];
          return Container(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Helpers.Style.BorderRadius),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only (
                              topLeft: Radius.circular(Helpers.Style.BorderRadius),
                              topRight: Radius.circular(Helpers.Style.BorderRadius)
                          ),
                          child: Image.asset('${Helpers.Paths.ImagesPath}${hotel.poster}', fit: BoxFit.fill),
                        ),
                        Container(
                            margin: EdgeInsets.all(MediaQuery.of(context).size.width/40),
                            child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text('${hotel.name}')
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child:  ElevatedButton(
                                          onPressed: () {Navigator.of(context).pushNamed(DetailedView.routeName, arguments: {Helpers.Keys.Uuid: hotel.uuid});},
                                          child: Text(Helpers.Messages.ButtonDetailsText)
                                      )
                                  )
                                ]
                            )
                        )
                      ]
                  )
              )
          );
        },
      );
  }
}

