import 'package:flutter/material.dart';

Widget myButton(url,text,nav) { return


 ElevatedButton(
                    onPressed: () {
                      nav.pushNamed(url);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child:  Text(text,
                    style: TextStyle(
                      color: Colors.black,
                      ),
                      ),
                  );
}

Widget myDropdownMenu() {
  final TextEditingController dropdownController = TextEditingController();

  return DropdownMenu<String>(
    controller: dropdownController,
    onSelected: (String? value) {
      print('Выбран: $value');
    },
    dropdownMenuEntries: [
      DropdownMenuEntry(value: 'option1', label: 'Первый вариант'),
      DropdownMenuEntry(value: 'option2', label: 'Второй вариант'),
      DropdownMenuEntry(value: 'option3', label: 'Третий вариант'),
    ],
  );
}