import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../functions/data_manager.dart';

class Page3 extends StatefulWidget {
  final DateTime selectedDate;

  const Page3({super.key, required this.selectedDate});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final TextEditingController _controller = TextEditingController();
  String? errorText;

  static final DateTime minDate = DateTime(2025, 10, 20);

  @override
  void initState() {
    super.initState();
    _loadForDate();
  }

  @override
  void didUpdateWidget(covariant Page3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _loadForDate();
      setState(() {
        errorText = null;
      });
    }
  }

  void _loadForDate() {
    final data = dataManager.getData(widget.selectedDate);
    if (data != null) {
      _controller.text = data.toString();
    } else {
      _controller.clear();
    }
  }

  void _onDataChanged(String val) {
    if (widget.selectedDate.isBefore(minDate)) {
      setState(() {
        errorText = 'La date doit être après le 20-10-25.';
      });
      return;
    } else {
      setState(() {
        errorText = null;
      });
    }

    final intValue = int.tryParse(val);
    if (intValue != null) {
      dataManager.setData(widget.selectedDate, intValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd-MM-yy').format(widget.selectedDate);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Entrez un nombre',
              hintStyle: const TextStyle(color: Colors.white54),
              errorText: errorText,
            ),
            onChanged: _onDataChanged,
          ),
        ],
      ),
    );
  }
}
