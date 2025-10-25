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
          title: const Text(
            'БЕСПЛАТНАЯ ДОСТАВКА ПО РОССИИ | WORLDWIDE DELIVERY',
            style: TextStyle(color: Colors.white, fontSize: 13.0),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 10), // Отступы
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Центрировать по горизонтали
                children: [
                  Image.network(
                    "https://img.icons8.com/?size=512&id=7I3BjCqe9rjG&format=png",
                    width: 120, // Размер картинки
                  ),
                  const SizedBox(width: 10), // Отступ между картинкой и кнопкой
                  ElevatedButton.icon(
                    onPressed: () {
                      // Действие при нажатии
                    },
                    
                    icon: const Icon(Icons.assignment),
                    label: const Text(''),
                    style: ElevatedButton.styleFrom(
                      elevation: 0, // убрать тень
                      side: BorderSide.none, // убрать границу
                      backgroundColor: Colors.transparent, // прозрачный фонshadowColor: Colors.transparent,
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // ширина по всей ширине и высота 50
                    ),
                    child: const Text('Все товары'),
                    ),
                    const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // ширина по всей ширине и высота 50
                    ),
                    child: const Text('Куртки'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // ширина по всей ширине и высота 50
                    ),
                        child: const Text('Толстовки'),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // ширина по всей ширине и высота 50
                    ),child: const Text('Штаны | Шорты'),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // ширина по всей ширине и высота 50
                    ),
                            child: const Text('Футболки'),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // ширина по всей ширине и высота 50
                    ),
                                child: const Text('Шапки'),
                                ),
                                ],
                                ),
            const SizedBox(height: 20),
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