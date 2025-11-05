import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: gpag(),
  ));
}

class gpag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Контейнер с высотой 100 и серым цветом
            Container(
              height: 100,
              color: Colors.grey,
            ),
            // Название товара
            Text(
              'Reebok',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Ряд с названием модели и звёздами
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eye Glasses',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ),
              ],
            ),
            // Блок с цветом и размером
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Колонка с "color" и иконками
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Color'),
                      Row(
                        children: [
                          // Можно разместить здесь цветовые иконки или образцы
                          Icon(Icons.circle, color: Colors.red),
                          Icon(Icons.circle, color: Colors.blue),
                          Icon(Icons.circle, color: Colors.green),
                        ],
                      ),
                    ],
                  ),
                  // Колонка с "size" и DropdownButton
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Size'),
                      DropdownButton<String>(
                        items: [
                          DropdownMenuItem(
                            child: Text('Small'),
                            value: 'Small',
                          ),
                          DropdownMenuItem(
                            child: Text('Medium'),
                            value: 'Medium',
                          ),
                          DropdownMenuItem(
                            child: Text('Large'),
                            value: 'Large',
                          ),
                        ],
                        onChanged: (value) {
                          // Обработчик изменения
                        },
                        hint: Text('Select size'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Дополнительный текст
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('lorem ipsum'),
            ),
            // Строка с двумя FloatingActionButton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}