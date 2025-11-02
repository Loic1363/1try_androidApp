import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../functions/data_manager.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    final dates = dataManager.generateDateRange();

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Date', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Donnée', style: TextStyle(color: Colors.white))),
          ],
          rows: dates.map((date) {
            final data = dataManager.getData(date);
            final dataStr = data?.toString() ?? '';
            final dateStr = DateFormat('dd-MM-yy').format(date);
            return DataRow(cells: [
              DataCell(Text(dateStr, style: const TextStyle(color: Colors.white))),
              DataCell(Text(dataStr, style: const TextStyle(color: Colors.white))),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
