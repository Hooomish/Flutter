import 'package:flutter/material.dart';
import 'package:hotels/views/main_view.dart';
import 'package:hotels/logic/helpers.dart' as Helpers;

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: () {
          Navigator.of(context).pushNamed(MainView.routeName, arguments: {Helpers.Keys.ListKey: true, Helpers.Keys.GridKey: false});
        }, icon: Icon(Icons.list)),
        IconButton(onPressed: () {
          Navigator.of(context).pushNamed(MainView.routeName, arguments: {Helpers.Keys.ListKey: false, Helpers.Keys.GridKey: true});
        }, icon: Icon(Icons.grid_view_sharp))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

