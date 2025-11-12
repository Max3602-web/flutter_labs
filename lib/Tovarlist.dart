import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Изображение товара
          Image.network(imageUrl),
          
          // Название товара
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          
          // Описание товара
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description),
          ),
          
          // Цена и кнопка
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Действие при нажатии
                  },
                  child: Text('Купить'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Использование внутри виджета Scaffold
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин'),
      ),
      body: ListView(
        children: [
          ProductCard(
            imageUrl: '',
            title: 'Товар 1',
            description: 'Описание товара 1',
            price: '₽999',
          ),
          // Тут можно добавлять больше карточек
        ],
      ),
    );
  }
}