import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/BottomSheetWidget.dart';
import 'package:servicerequest/widgets/CustomContainer.dart';

import '../Constants.dart';
import 'CutomWightRow.dart';

class InspectionMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(builder: (context, model, child) {
      return CustomContainer(
        childern: [
          CutomWightRow(
            onTap: () {
              model.setInspectionMethod(Inspection.WINCH);
              model.showBottomSheet(
                  context,
                  BottomSheetWidget(
                    serviceName: Constants.PERIODIC_CHECK,
                    serviceDetailsString: Constants.INSPECTION_WINCH,
                    cost: "550",
                    imagePath: "images/carPrimary.png",
                  ));
            },
            text: Constants.INSPECTION_WINCH,
            iconVisibility: model.inspectionMethod == Inspection.WINCH ||
                    model.inspectionMethod == null
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
              model.setInspectionMethod(Inspection.SERVICE_PROVIDER_HIMSELF);

              model.showBottomSheet(
                  context,
                  BottomSheetWidget(
                    serviceName: Constants.PERIODIC_CHECK,
                    serviceDetailsString: Constants.INSPECTION_PROVIDER_HIMSELF,
                    cost: "550",
                    imagePath: "images/carPrimary.png",
                  ));
            },
            text: Constants.INSPECTION_PROVIDER_HIMSELF,
            iconVisibility:
                model.inspectionMethod == Inspection.SERVICE_PROVIDER_HIMSELF
                    ? true
                    : false,
          )
        ],
      );
    });
  }
}
