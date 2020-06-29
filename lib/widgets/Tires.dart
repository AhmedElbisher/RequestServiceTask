import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/widgets/CustomContainer.dart';
import 'package:servicerequest/widgets/CutomWightRow.dart';

import '../Constants.dart';

class Tires extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataSource>(
      builder: (context, dataSource, child) {
        return CustomContainer(
          childern: [
            CutomWightRow(
              onTap: () {
                dataSource.setSelectedNumberOfTire(NumberOfTires.ONE);
              },
              text: "عدد 1 ايطار",
              iconVisibility:
                  dataSource.selectedNumberOfTires == NumberOfTires.ONE
                      ? true
                      : false,
            ),
            SizedBox(
              child: Divider(
                thickness: 2.0,
                color: Constants.KHelperColor,
              ),
            ),
            CutomWightRow(
              onTap: () {
                dataSource.setSelectedNumberOfTire(NumberOfTires.TWO);
              },
              text: "عدد 2 ايطار",
              iconVisibility:
                  dataSource.selectedNumberOfTires == NumberOfTires.TWO
                      ? true
                      : false,
            ),
            SizedBox(
              child: Divider(
                thickness: 2.0,
                color: Constants.KHelperColor,
              ),
            ),
            CutomWightRow(
              onTap: () {
                dataSource.setSelectedNumberOfTire(NumberOfTires.TREE);
              },
              text: "عدد 3 ايطار",
              iconVisibility:
                  dataSource.selectedNumberOfTires == NumberOfTires.TREE
                      ? true
                      : false,
            ),
            SizedBox(
              child: Divider(
                thickness: 2.0,
                color: Constants.KHelperColor,
              ),
            ),
            CutomWightRow(
              onTap: () {
                dataSource.setSelectedNumberOfTire(NumberOfTires.FOUR);
              },
              text: "عدد 4 ايطار",
              iconVisibility:
                  dataSource.selectedNumberOfTires == NumberOfTires.FOUR
                      ? true
                      : false,
            ),
          ],
        );
      },
    );
  }
}
