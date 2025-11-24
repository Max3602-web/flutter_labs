import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyMapApp());
}

class MyMapApp extends StatelessWidget {
  const MyMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Карта с красным маркером')),
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(27.76835491235998, -82.63928170066318),
            initialZoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            // Добавляем маркер
            MarkerLayer(
              markers: [
                Marker(
                  width: 30,
                  height: 30,
                  point: LatLng(27.76835491235998, -82.63928170066318), // координаты маркера
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}