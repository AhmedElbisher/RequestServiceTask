import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Constants.dart';

class ProviderInfoColumn extends StatelessWidget {
  final String name;
  final double rating;
  final bool offerExists;
  final String offerCost;
  final String normalCost;
  final Function onConfirm;

  ProviderInfoColumn(
      {this.name,
      this.rating,
      this.offerExists,
      this.onConfirm,
      this.offerCost,
      this.normalCost});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.end,
                textWidthBasis: TextWidthBasis.longestLine,
                style: Constants.KProviderTextStyle,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) {
                return index > (rating - 1)
                    ? Icon(
                        Icons.star_border,
                        color: Colors.black87,
                      )
                    : Icon(
                        Icons.star,
                        color: Color(0xffc3922e),
                      );
              },
              itemCount: 5,
              itemSize: 15.0,
              unratedColor: Colors.grey,
              direction: Axis.horizontal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
                visible: offerExists,
                child: Text("SRA $offerCost",
                    style: Constants.KProviderTextStyle)),
            Text("SRA $normalCost",
                style: offerExists
                    ? TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Constants.KDecorationColor,
                        color: Constants.KLineThouthTextColor,
                      )
                    : Constants.KProviderTextStyle)
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onConfirm,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  decoration: BoxDecoration(
                      color: Constants.KPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Center(
                    child: Text(
                      "موافق",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Constants.KaAccentColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
