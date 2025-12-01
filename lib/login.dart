import 'package:flutter/material.dart';
import 'package:flutter_labs/main.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MyLoginApp());
}

class MyLoginApp extends StatelessWidget {
  const MyLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => MainApp(),
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String message = '';

  void _login() async {
    // Показываем лоадер
    context.loaderOverlay.show();

    String login = _loginController.text;
    String password = _passwordController.text;

    const correctLogin = 'admin';
    const correctPassword = '1234';

    // Имитируем задержку (например, обращение к серверу)
    await Future.delayed(const Duration(seconds: 2));

    // Проверка логина и пароля
    if (login == correctLogin && password == correctPassword) {
      // Скрываем лоадер и переходим
      context.loaderOverlay.hide();
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Скрываем лоадер и показываем сообщение
      context.loaderOverlay.hide();
      setState(() {
        message = 'Неверный логин или пароль.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Логин')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _loginController,
              decoration: const InputDecoration(labelText: 'Логин'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Войти'),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
