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