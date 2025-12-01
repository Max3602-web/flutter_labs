import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const ChessExplosionApp());

class ChessExplosionApp extends StatelessWidget {
  const ChessExplosionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Взрывающаяся шахматная фигура',
      theme: ThemeData.dark(),
      home: const ChessExplosionScreen(),
    );
  }
}

class ChessExplosionScreen extends StatefulWidget {
  const ChessExplosionScreen({super.key});

  @override
  _ChessExplosionScreenState createState() => _ChessExplosionScreenState();
}

class _ChessExplosionScreenState extends State<ChessExplosionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExploded = false;
  List<Particle> _particles = [];
  final Random _random = Random();
  ChessPieceType _selectedPiece = ChessPieceType.king;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _explode() {
    setState(() {
      _isExploded = true;
      _particles.clear();
      
      // Создаем частицы для взрыва
      for (int i = 0; i < 50; i++) {
        _particles.add(Particle(
          x: 150,
          y: 150,
          vx: (_random.nextDouble() - 0.5) * 20,
          vy: (_random.nextDouble() - 0.5) * 20,
          color: _getParticleColor(),
          size: _random.nextDouble() * 10 + 5,
        ));
      }
    });

    _controller.forward().then((_) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isExploded = false;
          _particles.clear();
        });
        _controller.reset();
      });
    });
  }

  Color _getParticleColor() {
    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.white,
      Colors.grey[300]!,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  void _changePiece(ChessPieceType piece) {
    setState(() {
      _selectedPiece = piece;
      _isExploded = false;
      _particles.clear();
      _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Взрывающаяся шахматная фигура'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Выбор фигуры
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: ChessPieceType.values.map((piece) {
                  return ChoiceChip(
                    label: Text(piece.name),
                    selected: _selectedPiece == piece,
                    onSelected: (_) => _changePiece(piece),
                  );
                }).toList(),
              ),
            ),
            
            // Игровое поле
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown, width: 3),
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF8B4513), Color(0xFFD2691E)],
                ),
              ),
              child: Stack(
                children: [
                  // Клетки шахматной доски
                  _buildChessBoard(),
                  
                  // Взрыв частиц
                  if (_isExploded)
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: ParticlePainter(
                            particles: _particles,
                            animationValue: _controller.value,
                          ),
                        );
                      },
                    ),
                  
                  // Шахматная фигура
                  if (!_isExploded)
                    Center(
                      child: GestureDetector(
                        onTap: _explode,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 80,
                          height: 80,
                          child: CustomPaint(
                            painter: ChessPiecePainter(
                              pieceType: _selectedPiece,
                              isBlack: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            // Кнопка взрыва
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: _explode,
                icon: const Icon(Icons.add),
                label: const Text(
                  'Взорвать фигуру!',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            ),
            
            // Инструкция
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Нажмите на фигуру или кнопку, чтобы взорвать!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChessBoard() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemCount: 64,
      itemBuilder: (context, index) {
        int row = index ~/ 8;
        int col = index % 8;
        bool isDark = (row + col) % 2 == 0;
        
        return Container(
          color: isDark
              ? const Color(0xFFD18B47).withOpacity(0.7)
              : const Color(0xFFFFCE9E).withOpacity(0.7),
        );
      },
    );
  }
}

// Типы шахматных фигур
enum ChessPieceType {
  king('Король'),
  queen('Ферзь'),
  rook('Ладья'),
  bishop('Слон'),
  knight('Конь'),
  pawn('Пешка');

  const ChessPieceType(this.name);
  final String name;
}

// Класс для частиц взрыва
class Particle {
  double x, y;
  double vx, vy;
  Color color;
  double size;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.color,
    required this.size,
  });

  void update(double dt) {
    x += vx * dt * 60;
    y += vy * dt * 60;
    vy += 0.3; // Гравитация
  }
}

// Отрисовщик частиц
class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  ParticlePainter({
    required this.particles,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      particle.update(animationValue);
      
      final paint = Paint()
        ..color = particle.color.withOpacity(1 - animationValue)
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(
        Offset(particle.x, particle.y),
        particle.size * (1 - animationValue * 0.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) {
    return true;
  }
}

// Отрисовщик шахматных фигур
class ChessPiecePainter extends CustomPainter {
  final ChessPieceType pieceType;
  final bool isBlack;

  ChessPiecePainter({
    required this.pieceType,
    required this.isBlack,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isBlack ? Colors.black : Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = isBlack ? Colors.white : Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    // База фигуры
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius, borderPaint);

    // Символы фигур
    _drawPieceSymbol(canvas, center, radius, paint, borderPaint);
  }

  void _drawPieceSymbol(
    Canvas canvas,
    Offset center,
    double radius,
    Paint paint,
    Paint borderPaint,
  ) {
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    String symbol;
    switch (pieceType) {
      case ChessPieceType.king:
        symbol = '♔';
        break;
      case ChessPieceType.queen:
        symbol = '♕';
        break;
      case ChessPieceType.rook:
        symbol = '♖';
        break;
      case ChessPieceType.bishop:
        symbol = '♗';
        break;
      case ChessPieceType.knight:
        symbol = '♘';
        break;
      case ChessPieceType.pawn:
        symbol = '♙';
        break;
    }

    textPainter.text = TextSpan(
      text: symbol,
      style: TextStyle(
        fontSize: radius * 1.5,
        color: isBlack ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant ChessPiecePainter oldDelegate) {
    return oldDelegate.pieceType != pieceType || oldDelegate.isBlack != isBlack;
  }
}