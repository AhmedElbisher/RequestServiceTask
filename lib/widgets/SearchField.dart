import 'package:flutter/material.dart';

import '../Constants.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSummitted;

  SearchField({this.controller, this.onSummitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Opacity(
              opacity: .85,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: controller,
                    onSubmitted: onSummitted,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: "ابحث عن موقعك",
                      contentPadding: EdgeInsets.all(2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Constants.KaAccentColor,
                        size: Constants.KSearchIconSize,
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
