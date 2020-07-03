import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/model/ProviderInfo.dart';
import 'package:servicerequest/viewmodels/choose_provider_model.dart';
import 'package:servicerequest/widgets/MenuIcon.dart';
import 'package:servicerequest/widgets/ProviderCard.dart';

class ChooseProviderScreen extends StatefulWidget {
  @override
  _ChooseProviderScreenState createState() => _ChooseProviderScreenState();
}

class _ChooseProviderScreenState extends State<ChooseProviderScreen> {
  ChooseProviderModel model = ChooseProviderModel();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
        create: (_) => model.getAvailableProviders(),
        child: Center(
          child: Consumer<List<ProviderInfo>>(
            builder: (context, model, child) => model == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
//                      MapContainer(
//                        markers: model.markers.toSet(),
//                        currentPosition: model.userPosition,
//                      ),
                      MenuIcon(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.width * 2 / 5) + 20,
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.length < 2 ? model.length : 2,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ProviderCard(
                                    name: model[index].name,
                                    rating: model[index].rating,
                                    normalCost: model[index].cost,
                                    offerCost: model[index].offerCost,
                                    imagePath: model[index].pictureUrl,
                                    offerExists: true,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }
}
