import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/BackArrow.dart';
import 'package:servicerequest/widgets/MenuIcon.dart';
import 'package:servicerequest/widgets/mapContainer.dart';

class SelectServiceScreen extends StatefulWidget {
  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                MapContainer(
                  markers: model.markers.toSet(),
                  currentPosition: model.userPosition,
                ),
                MenuIcon(),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: model.getProperWiget()),
                BackArrow(
                  back: () {
                    model.back(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
//if (Provider.of<DataSource>(context).status == Status.No_Result) {
//showDialog(
//context: context,
//builder: (context) {
//return AlertDialog(
//title: Text("no result"),
//);
//});
//}
