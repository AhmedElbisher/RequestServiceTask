class ProviderInfo {
  String _name;
  String _PictureUrl;
  String _offerCost; //null if it not exist
  String _cost;
  String _phoneNumber;
  double _rating;

  ProviderInfo(this._name, this._PictureUrl, this._offerCost, this._cost,
      this._phoneNumber, this._rating);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get PictureUrl => _PictureUrl;

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get cost => _cost;

  set cost(String value) {
    _cost = value;
  }

  String get offerCost => _offerCost;

  set offerCost(String value) {
    _offerCost = value;
  }

  set PictureUrl(String value) {
    _PictureUrl = value;
  }
}
