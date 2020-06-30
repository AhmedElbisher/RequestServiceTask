import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/widgets/CustomContainer.dart';

import '../Constants.dart';
import 'CutomWightRow.dart';

class InspectionMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataSource>(builder: (context, dataSource, child) {
      return CustomContainer(
        childern: [
          CutomWightRow(
            onTap: () {
              dataSource.addMarkers();
              dataSource.setInspectionMetod(Inspection.WINCH);
              dataSource.setStatus(Status.SELECT_PROVIDER);
            },
            text: "النقل بالونش",
            iconVisibility:
                dataSource.inspection == Inspection.WINCH ? true : false,
          ),
          SizedBox(
            child: Divider(
              thickness: 2.0,
              color: Constants.KHelperColor,
            ),
          ),
          CutomWightRow(
            onTap: () {
              dataSource.addMarkers();
              dataSource
                  .setInspectionMetod(Inspection.SERVICE_PROVIDER_HIMSELF);
              dataSource.setStatus(Status.SELECT_PROVIDER);
            },
            text: "النقل بواسطة القائم بالفحص",
            iconVisibility:
                dataSource.inspection == Inspection.SERVICE_PROVIDER_HIMSELF
                    ? true
                    : false,
          )
        ],
      );
    });
  }
}
