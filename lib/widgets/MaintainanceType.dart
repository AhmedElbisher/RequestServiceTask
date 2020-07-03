import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/CustomContainer.dart';

import '../Constants.dart';
import 'BottomSheetWidget.dart';
import 'CutomWightRow.dart';

class MaintainanceType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(builder: (context, model, child) {
      return CustomContainer(
        childern: [
          CutomWightRow(
            onTap: () {
              model.setMaintainance(Maintainance.ELECTRICAL);
              model.showBottomSheet(
                  context,
                  BottomSheetWidget(
                    serviceName: Constants.MAINTAINANCE,
                    serviceDetailsString: Constants.MAINTAINANCE_ELECTICAL,
                    cost: "550",
                    imagePath: "images/providerMarker.png",
                  ));
            },
            text: Constants.MAINTAINANCE_ELECTICAL,
            iconVisibility: model.maintainance == Maintainance.ELECTRICAL ||
                    model.maintainance == null
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
              model.setMaintainance(Maintainance.MECHANICAL);
              model.showBottomSheet(
                  context,
                  BottomSheetWidget(
                    serviceName: Constants.MAINTAINANCE,
                    serviceDetailsString: Constants.MAINTAINANCE_MECHANICAL,
                    cost: "550",
                    imagePath: "images/providerMarker.png",
                  ));
            },
            text: Constants.MAINTAINANCE_MECHANICAL,
            iconVisibility:
                model.maintainance == Maintainance.MECHANICAL ? true : false,
          ),
          SizedBox(
            child: Divider(
              thickness: 2.0,
              color: Constants.KHelperColor,
            ),
          ),
          CutomWightRow(
            onTap: () {
              model.setMaintainance(Maintainance.OTHER);
              model.showBottomSheet(
                  context,
                  BottomSheetWidget(
                    serviceName: Constants.MAINTAINANCE,
                    serviceDetailsString: Constants.MAINTAINANCE_OTHER,
                    cost: "550",
                    imagePath: "images/providerMarker.png",
                  ));
            },
            text: Constants.MAINTAINANCE_OTHER,
            iconVisibility:
                model.maintainance == Maintainance.OTHER ? true : false,
          ),
        ],
      );
    });
  }
}
