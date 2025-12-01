import 'package:flutter/material.dart';

void main() => runApp(const BottomNavigationBarEnhancedApp());

class BottomNavigationBarEnhancedApp extends StatelessWidget {
  const BottomNavigationBarEnhancedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavigationBarEnhanced(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}

class BottomNavigationBarEnhanced extends StatefulWidget {
  const BottomNavigationBarEnhanced({super.key});

  @override
  State<BottomNavigationBarEnhanced> createState() => _BottomNavigationBarEnhancedState();
}

class _BottomNavigationBarEnhancedState extends State<BottomNavigationBarEnhanced> {
  int _selectedIndex = 0;

  // Страницы с кнопками
  Widget _buildPage(String title, BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Кнопка на $title нажата!')),
              );
            },
            child: const Text('Нажми меня'),
          ),
        ],
      ),
    );
  }

  static const List<String> _titles = [
    'Домашняя страница',
    'Бизнес',
    'Образование',
    'Настройки'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Улучшаем BottomNavigationBar'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.indigo,
      ),
      body: _buildPage(_titles[_selectedIndex], context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey[600],
        elevation: 10,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Бизнес',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Обучение',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}