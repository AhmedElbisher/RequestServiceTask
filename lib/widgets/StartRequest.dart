import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';

import 'Button1.dart';
import 'WhiteBottomContainer.dart';

class StartRequest extends StatelessWidget {
  final Function onPress;
  StartRequest({this.onPress});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: Provider.of<DataSource>(context)
              .currentLocationContainerVisablitity,
          child: WhiteBottomContainer(
            cancelIconVisability: false,
            onCancel: () => Provider.of<DataSource>(context)
                .setCurrentLocationContainerVisablitity(false),
            currentLocationName:
                Provider.of<DataSource>(context).currentPostionName,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Button1(
            onPress: onPress,
            text: "الفحص الدورى للسيارة",
          ),
        ),
      ],
    );
  }
}
