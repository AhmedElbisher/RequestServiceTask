import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/CustomContainer.dart';
import 'package:servicerequest/widgets/CutomWightRow.dart';

import '../Constants.dart';
import 'BottomSheetWidget.dart';

class Tires extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(
      builder: (context, model, child) {
        return CustomContainer(
          childern: [
            CutomWightRow(
              onTap: () {
                model.setNumberOfTires(NumberOfTires.ONE);
                model.showBottomSheet(
                    context,
                    BottomSheetWidget(
                      serviceName: Constants.CHANGE_TIRES,
                      serviceDetailsString: Constants.ONE_TIRE,
                      cost: "550",
                      imagePath: "images/providerMarker.png",
                    ));
              },
              text: Constants.ONE_TIRE,
              iconVisibility: model.numberOfTires == NumberOfTires.ONE ||
                      model.numberOfTires == null
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
                model.setNumberOfTires(NumberOfTires.TWO);
                model.showBottomSheet(
                    context,
                    BottomSheetWidget(
                      serviceName: Constants.CHANGE_TIRES,
                      serviceDetailsString: Constants.TWO_TIRE,
                      cost: "550",
                      imagePath: "images/providerMarker.png",
                    ));
              },
              text: Constants.TWO_TIRE,
              iconVisibility:
                  model.numberOfTires == NumberOfTires.TWO ? true : false,
            ),
            SizedBox(
              child: Divider(
                thickness: 2.0,
                color: Constants.KHelperColor,
              ),
            ),
            CutomWightRow(
              onTap: () {
                model.setNumberOfTires(NumberOfTires.TREE);
                model.showBottomSheet(
                    context,
                    BottomSheetWidget(
                      serviceName: Constants.CHANGE_TIRES,
                      serviceDetailsString: Constants.THREE_TIRE,
                      cost: "550",
                      imagePath: "images/providerMarker.png",
                    ));
              },
              text: Constants.THREE_TIRE,
              iconVisibility:
                  model.numberOfTires == NumberOfTires.TREE ? true : false,
            ),
            SizedBox(
              child: Divider(
                thickness: 2.0,
                color: Constants.KHelperColor,
              ),
            ),
            CutomWightRow(
              onTap: () {
                model.setNumberOfTires(NumberOfTires.FOUR);
                model.showBottomSheet(
                    context,
                    BottomSheetWidget(
                      serviceName: Constants.CHANGE_TIRES,
                      serviceDetailsString: Constants.FOUR_TIRE,
                      cost: "550",
                      imagePath: "images/providerMarker.png",
                    ));
              },
              text: Constants.FOUR_TIRE,
              iconVisibility:
                  model.numberOfTires == NumberOfTires.FOUR ? true : false,
            ),
          ],
        );
      },
    );
  }
}
