import 'package:flutter/material.dart';

import '../Constants.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () {
            print("to menu screen");
          }, //to menu screen
          child: Icon(Icons.menu,
              color: Colors.white, size: Constants.KSearchIconSize),
        ),
      ),
    );
  }
}
