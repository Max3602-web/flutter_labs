import 'package:flutter/material.dart';
import 'package:flutter_labs/Footbolki.dart';
import 'package:flutter_labs/Shtani&shorti.dart';
import 'package:flutter_labs/widgets.dart';
import 'KurtkiPage.dart';
import 'Tolstovki.dart';
import 'Footbolki.dart';
import 'Shapki.dart';
import 'Castombar.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    initialRoute: '/',
    routes: {
      '/all':(context) => const MainApp(),
      '/kurtki': (context) => const KurtkiPage(),
      '/Tolstovki':(context) => const Tolstovki(),
      '/Shtani&shorti':(cantext) => const Shtanishorti(),
      '/Footbolki':(cantext) => const Footbolki(),
      '/Shapki':(cantext) => const Shapki(),
      '/Castombar':(cantext) => CustomNavBar(),
    },
    home: const MainApp(),
  ));
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
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end, // справа налево
                  children: [
                    // Корзина с счетчиком
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          onPressed: () {

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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Все товары',
                    style: TextStyle(
                      color: Colors.black,
                      ),
                      ),
                  ),
                  const SizedBox(height: 20),//кнопка кон
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed('/kurtki');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        ),
                        child: const Text('Куртки',
                    style: TextStyle(
                      color: Colors.black,
                      ),
                      ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed('/Tolstovki');
                        },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Толстовки',
                    style: TextStyle(
                      color: Colors.black,
                      ),
                      ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed('/Shtani&shorti');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Штаны | Шорты',
                    style: TextStyle(
                      color: Colors.black,
                      ),
                      ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed('/Footbolki');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text('Футболки',
                    style: TextStyle(
                      color: Colors.black,
                      ),
                      ),
                  ),
                  const SizedBox(height: 20),
                myButton('a','a',navigatorKey.currentState),
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