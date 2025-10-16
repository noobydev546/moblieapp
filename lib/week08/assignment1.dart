import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1> {
  DateTime now = DateTime.now();
  late DateTime currentTime;
  String date1 = '';
  String date2 = '';
  DateTime? fromDate;

  @override
  void initState() {
    super.initState();
    currentTime = DateTime(now.year, now.month, now.day);
    date1 = '${currentTime.day}/${currentTime.month}/${currentTime.year}';
    date2 = '${currentTime.day}/${currentTime.month}/${currentTime.year}';
  }

  void showCalender1() async {
    DateTime now = DateTime.now();
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month, 1),
      lastDate: DateTime(now.year + 1, now.month, 31),
    );
    if (dt != null) {
      setState(() {
        fromDate = dt;
        date1 = '${dt.day}/${dt.month}/${dt.year}';
        date2 = '';
      });
    } else {
      setState(() {
        date1 = 'Please select a date';
      });
    }
  }

  void showCalender2() async {
    if (fromDate == null || date1 == 'Please select a date') {
      setState(() {
        date2 = 'Please select From date first!';
      });
      return;
    }

    DateTime now = DateTime.now();
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: fromDate!,
      firstDate: fromDate!,
      lastDate: DateTime(now.year + 1, now.month, 31),
    );
    if (dt != null) {
      setState(() {
        date2 = '${dt.day}/${dt.month}/${dt.year}';
      });
    } else {
      setState(() {
        date2 = 'Please select a date';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DatePicker Demo', style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: showCalender1,
                  icon: Icon(Icons.calendar_today),
                  label: Text('From'),
                ),
                SizedBox(width: 10),
                Text(date1),
              ],
            ),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: showCalender2,
                  icon: Icon(Icons.calendar_today),
                  label: Text('To'),
                ),
                SizedBox(width: 10),
                Text(date2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
