import 'package:flutter/material.dart';
import 'main.dart';

class KurtkiPage extends StatelessWidget {
  const KurtkiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30.0,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text(
            'Окак',
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          ),
        ),
        body: Column(
          children: [
            // Основной контент
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://img.icons8.com/?size=512&id=7I3BjCqe9rjG&format=png",
                    width: 120,
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.assignment),
                    label: const Text(''),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide.none,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Кнопки сверху
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ElevatedButton(//кнопка нач
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Все товары'),
                  ),
                  const SizedBox(height: 20),//кнопка кон
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Куртки'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Толстовки'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Штаны | Шорты'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Футболки'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Шапки'),
                  ),
                ],
              ),
            ),
            // Добавьте нижний блок здесь
            CustomFooter(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = Colors.blue; // цвет кнопок
    final iconColor = Colors.red; // цвет иконок

    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey, // фон
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // выравнивание по левому краю
        children: [
          // Две кнопки
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Доставка и возврат'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // цвет фона
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Условия обслуживания',),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Надпись
          Text(
            '© 2025 All rights reserved / ROCKIT',
            style: TextStyle(fontSize: 12,color: Colors.white),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          // Иконки соцсетей
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                color: iconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                color: iconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send),
                color: iconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.videogame_asset),
                color: iconColor,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.message),
                color: iconColor,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}