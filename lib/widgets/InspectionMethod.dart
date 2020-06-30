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
              //todo the correct implementation of this function
              dataSource.addMarkers();
              dataSource
                  .setInspectionMetod(Inspection.SERVICE_PROVIDER_HIMSELF);
              dataSource.setStatus(Status.No_Result);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: FittedBox(
                        fit: BoxFit.cover,
                        child: Container(
                          margin: EdgeInsets.all(30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage("images/noCar.png"),
                                  ),
                                  Text(
                                    "لا يوجد نتائج حاول مره اخرى",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Constants.KPrimaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
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
