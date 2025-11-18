import 'package:flutter/material.dart';
import 'package:flutter_labs/main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const tablecalendar()));
}

class tablecalendar extends StatelessWidget {
  const tablecalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TableCalendar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar Example'),
        backgroundColor: Colors.blue, // Можно установить цвет фона здесь
      ),
      body: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2025, 12, 12),
          focusedDay: DateTime.now(),
        ),
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigatorKey.currentState?.pushNamed('/'); 
      },
      child: const Text("Back to main"),
    );
  }
}