import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'ProviderInfoColumn.dart';

class ProviderCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final double rating;
  final bool offerExists;
  final String offerCost;
  final String normalCost;

  ProviderCard(
      {this.imagePath,
      this.name,
      this.rating,
      this.offerExists,
      this.offerCost,
      this.normalCost});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double baseSize = size.width > size.height ? size.height : size.width;
    return Container(
      width: baseSize * 3 / 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(6.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 16,
                  height: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("images/redmark.png"),
                  )),
                  margin: EdgeInsets.only(left: 6),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ProviderInfoColumn(
                      rating: rating,
                      name: name,
                      offerExists: offerExists,
                      offerCost: offerCost,
                      normalCost: normalCost,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 8),
                      child: CircleAvatar(
                        backgroundColor: Color(0xffdedede),
                        radius: 10,
                        child: Icon(
                          Icons.clear,
                          size: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8, left: 10, bottom: 8),
                      child: CircleAvatar(
                        minRadius: 35,
                        maxRadius: 35,
                        backgroundImage: AssetImage(imagePath),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
