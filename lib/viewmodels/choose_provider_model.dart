import 'package:servicerequest/model/ProviderInfo.dart';

class ChooseProviderModel {
  //todo change thies initial values
  List<ProviderInfo> providers = [];
  int providersCount = 0;

  Future<dynamic> delayTosimulateCallingApi() {
    return Future.delayed(Duration(seconds: 5));
  }

  Future<List<ProviderInfo>> getAvailableProviders() async {
    print("______________________________________________________");
    List<ProviderInfo> providers = [];
    delayTosimulateCallingApi();
    providers.add(ProviderInfo(
      name: "محمد ابن عبدالرحمن",
      rating: 4.0,
      cost: "200",
      offerCost: "150",
      pictureUrl: "images/profile.png",
    ));
    providers.add(ProviderInfo(
      name: "محمد ابن عبدالرحمن",
      rating: 4.0,
      cost: "200",
      offerCost: "150",
      pictureUrl: "images/profile.png",
    ));
    providersCount = providers.length;
    return providers;
  }
}
