import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30.0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text('Панк рок магазин',style: TextStyle(color:Colors.white,fontSize: 13.0,),), // Заголовок
        ),
        body:Column(children: [ Container(
          height: 100, // задайте нужную высоту
          color: Colors.black, // цвет для наглядности
          child: Center(
          child: Text('Это контейнер под AppBar',style: TextStyle(color:Colors.grey,),)))
        , Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Hello Панки!', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Text('Рок', style: TextStyle(fontSize: 18)),
                ],
              
            ),
            // Центрированная кнопка
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  // Обработчик
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}