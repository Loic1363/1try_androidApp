class DataManager {
  final Map<DateTime, int> _dataMap = {};

  void setData(DateTime date, int value) {
    _dataMap[DateTime(date.year, date.month, date.day)] = value;
  }

  int? getData(DateTime date) {
    return _dataMap[DateTime(date.year, date.month, date.day)];
  }

  List<DateTime> generateDateRange() {
    DateTime start = DateTime(2025, 10, 20);
    DateTime end = DateTime(2026, 8, 20);
    List<DateTime> dates = [];
    for (DateTime date = start;
        !date.isAfter(end);
        date = date.add(const Duration(days: 1))) {
      dates.add(date);
    }
    return dates;
  }
}

final dataManager = DataManager();
