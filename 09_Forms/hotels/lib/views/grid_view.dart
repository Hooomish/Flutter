import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;
import 'package:hotels/views/detailed_view.dart';

class MyGridView extends StatefulWidget {
  MyGridView({Key? key, required this.hotels}) : super(key: key);
  List<HotelPreview> hotels;

  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.hotels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Helpers.Style.AxisCount,
            mainAxisSpacing: Helpers.Style.AxisSpacing,
            crossAxisSpacing: Helpers.Style.AxisSpacing
        ),
        itemBuilder: (context, index) {
          var hotel = widget.hotels[index];

          return Container(
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Helpers.Style.BorderRadius)
                  ),
                  child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only (
                                      topLeft: Radius.circular(Helpers.Style.BorderRadius),
                                      topRight: Radius.circular(Helpers.Style.BorderRadius)
                                  ),
                                  child: Image.asset('${Helpers.Paths.ImagesPath}${hotel.poster}', fit: BoxFit.cover),
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  child: Text('${hotel.name}', textAlign: TextAlign.center),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: Helpers.Style.Padding, left: Helpers.Style.Padding),
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  onPressed: () {Navigator.of(context).pushNamed(DetailedView.routeName, arguments: {Helpers.Keys.Uuid: hotel.uuid});},
                                  child: Text(Helpers.Messages.ButtonDetailsText),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(Helpers.Style.BorderRadius),
                                              bottomLeft: Radius.circular(Helpers.Style.BorderRadius)
                                          )
                                      )
                                  ),
                                )
                            )
                          ]
                      )
                  )
              )
          );
        }
        );
  }
}