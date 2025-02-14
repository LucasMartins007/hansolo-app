import 'package:flutter/material.dart';

class CustomMap extends StatelessWidget {
  final List<MapPoint> points;
  final String mapImageUrl;

  CustomMap({required this.points, required this.mapImageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa Customizado'),
      ),
      body: Center(
        child: Stack(
          children: [
            // Imagem de fundo do mapa
            Image.network(
              mapImageUrl,
              fit: BoxFit.cover,
            ),
            // Desenho dos pontos e linhas
            CustomPaint(
              size: Size(600, 400), // Tamanho da imagem de fundo
              painter: MapPainter(points: points),
            ),
          ],
        ),
      ),
    );
  }
}

class MapPoint {
  final Offset position; // Posição relativa no mapa
  final String label; // Rótulo ou valor associado ao ponto
  final Color color; // Cor do ponto

  MapPoint({required this.position, required this.label, this.color = Colors.red});
}

class MapPainter extends CustomPainter {
  final List<MapPoint> points;

  MapPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final pointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Desenha as linhas entre os pontos
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i].position, points[i + 1].position, paint);
    }

    // Desenha os pontos
    for (var point in points) {
      canvas.drawCircle(point.position, 5, pointPaint);

      // Exibe o rótulo ao lado do ponto
      final textPainter = TextPainter(
        text: TextSpan(
          text: point.label,
          style: TextStyle(color: point.color, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, point.position + Offset(10, -10));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomMap(
      mapImageUrl:
      'https://maps.googleapis.com/maps/api/staticmap?center=-23.5505,-46.6333&zoom=10&size=600x400&maptype=roadmap&key=AIzaSyCVQmfg0Emt0T_2XVM6UdxynpUVcdkOOZw',
      points: [
        MapPoint(
          position: Offset(100, 200),
          label: 'Ponto 1: Valor X',
          color: Colors.red,
        ),
        MapPoint(
          position: Offset(300, 150),
          label: 'Ponto 2: Valor Y',
          color: Colors.green,
        ),
        MapPoint(
          position: Offset(500, 300),
          label: 'Ponto 3: Valor Z',
          color: Colors.blue,
        ),
      ],
    ),
  ));
}