import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DateTimeHelper.dart';
import 'package:servicerequest/widgets/ConfirmButton.dart';
import 'package:servicerequest/widgets/CustomBottomSheetContainer.dart';
import 'package:servicerequest/widgets/PickerConstructor.dart';
import 'package:servicerequest/widgets/grayLine.dart';

import '../Constants.dart';

class ScheduleWidget extends StatefulWidget {
  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  int selectedDay = 1;
  int selectedHR = 1;
  int selectedAm = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeHepper>(
      builder: (context, datetime, childern) => CustomBottomSheetContainer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GrayLine(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: PickerConstructor(
                        initIndex: 0,
                        onSelectedChanged: (index) {
                          setState(() {
                            selectedAm = index;
                          });
                        },
                        itemBuiler: (context, i) {
                          return Center(
                              child: Text(Constants.AMPM[i],
                                  style: i == selectedAm
                                      ? Constants.KSelectedItem
                                      : Constants.KUnSelectedItem));
                        },
                        builderCount: Constants.AMPM.length,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: PickerConstructor(
                        initIndex: 1,
                        onSelectedChanged: (index) {
                          setState(() {
                            selectedHR = index;
                          });
                        },
                        itemBuiler: (context, i) {
                          return Center(
                              child: Text(Constants.hours[i],
                                  style: i == selectedHR
                                      ? Constants.KSelectedHr
                                      : Constants.KUnSelectedHr));
                        },
                        builderCount: Constants.hours.length,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: PickerConstructor(
                        initIndex: 1,
                        onSelectedChanged: (index) {
                          setState(() {
                            selectedDay = index;
                          });
                        },
                        itemBuiler: (context, i) {
                          return Center(
                              child: Text(datetime.dayesList[i],
                                  style: i == selectedDay
                                      ? Constants.KSelectedItem
                                      : Constants.KUnSelectedItem));
                        },
                        builderCount: datetime.dayesList.length,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ConfirmButton(
                      text: "تأكيد",
                      onPress: () => DateTimeHepper()
                          .getScheduleDate(selectedDay, selectedHR, selectedAm),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
