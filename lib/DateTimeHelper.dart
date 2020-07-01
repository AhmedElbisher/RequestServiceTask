import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeHepper extends ChangeNotifier {
  List<String> _dayesList = ["اليوم", "غدا"];
  DateTime _selectedSchedualeTime;
  DateTime now = DateTime.now();

  set selectedSchedualeTime(DateTime value) {
    _selectedSchedualeTime = value;
  }

  List<String> get dayesList => _dayesList;
  DateTime get selectedSchedualeTime => _selectedSchedualeTime;

  Future<List<String>> getdaysList() async {
    await initializeDateFormatting("ar_SA", null);
    List<String> days = [];
    var dayName = DateFormat('EEEE', "ar_SA");
    var dayNumOfMonth = DateFormat('Md', "en");
    for (int i = 2; i < 30; i++) {
      String name = dayName.format(now.add(Duration(days: i)));
      String date = dayNumOfMonth.format(now.add(Duration(days: i)));
      _dayesList.add("$name $date");
    }
    notifyListeners();
  }

  void getScheduleDate(int day, int hour, int am) {
    int selectedHour = (am == 0) ? hour + 1 : hour + 13;
    if (selectedHour > 23) selectedHour = 0;
    int difference = selectedHour - now.hour;
    selectedSchedualeTime = now.add(Duration(days: day, hours: difference));
    _selectedSchedualeTime = selectedSchedualeTime
        .subtract(Duration(minutes: now.minute, seconds: now.second));
    print(selectedSchedualeTime.toString());
  }
}
