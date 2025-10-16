import 'package:flutter/material.dart';

class DatepickerDemo extends StatefulWidget {
  const DatepickerDemo({super.key});

  @override
  State<DatepickerDemo> createState() => _DatepickerDemoState();
}

class _DatepickerDemoState extends State<DatepickerDemo> {
  String date = '';
  String time = '';
  String dialog = '';

  void showTime() async {
    TimeOfDay? td = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (td != null) {
      setState(() {
        time = '${td.hour}:${td.minute.toString().padLeft(2, '0')}';
      });
    } else {
      setState(() {
        time = 'Please select time';
      });
    }
  }

  void showAlert() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                width: 64,
                'https://www.vhv.rs/dpng/d/433-4339343_transparent-cancelled-clipart-cancel-clipart-hd-png-download.png',
              ),
              Text('The item will be removed permanently!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  dialog = 'You choose OK';
                });
              },
              child: const Text('Ok'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  dialog = 'You choose Cancel';
                });
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void showCalender() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 10, 1),
      lastDate: DateTime(DateTime.now().year, 10, 31),
    );
    if (dt != null) {
      setState(() {
        date = '${dt.day}/${dt.month}/${dt.year}';
      });
    } else {
      setState(() {
        date = 'Please select a date';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(date),
            FilledButton.icon(
              onPressed: showCalender,
              icon: const Icon(Icons.calendar_today),
              label: const Text('Select Date'),
            ),
            const SizedBox(height: 30),
            Text(time),
            FilledButton.icon(
              onPressed: showTime,
              icon: const Icon(Icons.access_time),
              label: const Text('Select Time'),
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: showAlert,
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
            Text(dialog),
          ],
        ),
      ),
    );
  }
}
