import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // цвет фона, по аналогии с CSS
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // справа налево
        children: [
          // Корзина с счетчиком
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // действие при клике
                },
                tooltip: "Корзина",
              ),
              // счетчик внутри Stack
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      '0', // сюда можно вставить динамический счетчик
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Меню гамбургер
          IconButton(
            icon: Container(
              width: 24,
              height: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 2, color: Colors.white),
                  Container(height: 2, color: Colors.white),
                  Container(height: 2, color: Colors.white),
                ],
              ),
            ),
            onPressed: () {
              // действие при клике
            },
            tooltip: "Меню",
          ),
        ],
      ),
    );
  }
}