import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class DataManager {
  final Map<DateTime, int> _dataMap = {};

  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  Future<void> loadData() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final content = await file.readAsString();
        final jsonData = jsonDecode(content) as Map<String, dynamic>;
        _dataMap.clear();
        jsonData.forEach((key, value) {
          final date = DateTime.parse(key);
          _dataMap[DateTime(date.year, date.month, date.day)] = value;
        });
      }
    } catch (e) {
      // ignore errors or log
    }
  }

  Future<void> saveData() async {
    final file = await _localFile;
    final Map<String, int> jsonData = {};
    _dataMap.forEach((key, value) {
      jsonData[key.toIso8601String()] = value;
    });
    await file.writeAsString(jsonEncode(jsonData));
  }

  void setData(DateTime date, int value) {
    _dataMap[DateTime(date.year, date.month, date.day)] = value;
    saveData(); // Sauvegarde à chaque mise à jour
  }

  int? getData(DateTime date) {
    return _dataMap[DateTime(date.year, date.month, date.day)];
  }

  List<DateTime> generateDateRange() {
    DateTime start = DateTime(2025, 10, 20);
    DateTime end = DateTime(2026, 8, 20);
    List<DateTime> dates = [];
    for (DateTime date = start; !date.isAfter(end); date = date.add(const Duration(days: 1))) {
      dates.add(date);
    }
    return dates;
  }
}

final dataManager = DataManager();
