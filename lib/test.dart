import 'dart:ui';

import 'package:flutter/material.dart';

class IntensityMap extends StatelessWidget {
  final List<DataPoint> points;
  final String mapImageUrl;
  final double pointSize; // Tamanho dos pontos
  final double influenceRadius; // Raio de influência dos pontos

  IntensityMap({
    required this.points,
    required this.mapImageUrl,
    this.pointSize = 5,
    this.influenceRadius = 0, // Raio de influência padrão
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Imagem de fundo do mapa com filtro de preto e branco
          ColorFiltered(
            colorFilter: ColorFilter.matrix([
              0.2126, 0.7152, 0.0722, 0, 0, // Filtro de escala de cinza
              0.2126, 0.7152, 0.0722, 0, 0,
              0.2126, 0.7152, 0.0722, 0, 0,
              0, 0, 0, 1, 0,
            ]),
            child: Image.network(
              mapImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                      'Erro ao carregar o mapa. Verifique a URL e a chave de API.'),
                );
              },
            ),
          ),
          // Desenho das áreas coloridas ao redor dos pontos
          CustomPaint(
            size: Size(600, 200), // Tamanho da imagem de fundo
            painter: IntensityPainter(
              points: points,
              pointSize: pointSize,
              influenceRadius: influenceRadius,
            ),
          ),
        ],
      ),
    );
  }
}

class DataPoint {
  final Offset position; // Posição relativa no mapa
  final double value; // Valor associado ao ponto

  DataPoint({required this.position, required this.value});
}

class IntensityPainter extends CustomPainter {
  final List<DataPoint> points;
  final double pointSize; // Tamanho dos pontos
  final double influenceRadius; // Raio de influência dos pontos

  IntensityPainter({
    required this.points,
    this.pointSize = 5,
    this.influenceRadius = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define uma escala de cores (vermelho -> amarelo -> verde)
    final List<Color> colorScale = [
      Colors.red, // Valores menores
      Colors.yellow, // Valores intermediários
      Colors.green, // Valores maiores
    ];

    // Encontra o valor mínimo e máximo para normalização
    double minValue =
    points.map((p) => p.value).reduce((a, b) => a < b ? a : b);
    double maxValue =
    points.map((p) => p.value).reduce((a, b) => a > b ? a : b);

    // Desenha as áreas coloridas ao redor dos pontos com bordas esfumaçadas
    for (var point in points) {
      // Calcula a cor com base no valor do ponto
      double normalizedValue = (point.value - minValue) / (maxValue - minValue);
      Color color = _getColorFromScale(colorScale, normalizedValue);

      // Cria um degradê radial para o efeito esfumaçado
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            color.withOpacity(0.8), // Cor sólida no centro
            color.withOpacity(0.0), // Transparente nas bordas
          ],
          stops: [0.0, 1.0], // Define a transição
        ).createShader(
          Rect.fromCircle(
            center: point.position,
            radius: influenceRadius,
          ),
        );

      // Desenha o círculo com o degradê radial
      canvas.drawCircle(point.position, influenceRadius, paint);
    }

    // Desenha os pontos
    final pointPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (var point in points) {
      canvas.drawCircle(
          point.position, pointSize, pointPaint); // Usa o tamanho personalizado
    }
  }

  // Função para obter a cor da escala com base no valor normalizado
  Color _getColorFromScale(List<Color> colors, double normalizedValue) {
    if (normalizedValue <= 0.0) return colors.first;
    if (normalizedValue >= 1.0) return colors.last;

    // Calcula o índice da cor na escala
    double segment = 1.0 / (colors.length - 1);
    int index = (normalizedValue / segment).floor();
    double t = (normalizedValue - (index * segment)) / segment;

    // Interpola entre as duas cores mais próximas
    return Color.lerp(colors[index], colors[index + 1], t)!;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void main() {
  runApp(MaterialApp(
    home: IntensityMap(
      mapImageUrl:
      'https://maps.googleapis.com/maps/api/staticmap?center=-24.952199,%20-53.575196&zoom=15&size=600x400&maptype=satellite&key=AIzaSyCVQmfg0Emt0T_2XVM6UdxynpUVcdkOOZw',
      points: [
        DataPoint(position: Offset(200, 50), value: 55),
        DataPoint(position: Offset(240, 100), value: 50),
        DataPoint(position: Offset(190, 100), value: 50),
        DataPoint(position: Offset(160, 150), value: 90),
        DataPoint(position: Offset(225, 160), value: 90),
        DataPoint(position: Offset(260, 180), value: 70),
      ],
      pointSize: 1, // Tamanho personalizado dos pontos
      influenceRadius: 60, // Raio de influência maior
    ),
  ));
}