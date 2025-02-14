import 'package:flutter/cupertino.dart';
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
            size: Size(600, 450), // Tamanho da imagem de fundo
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
  final String label; // Rótulo do ponto (ex: "P1", "P2")

  DataPoint({required this.position, required this.value, required this.label});
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

    // Desenha os pontos e os textos
    final pointPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );

    for (var point in points) {
      // Desenha o ponto
      canvas.drawCircle(point.position, pointSize, pointPaint);

      // Desenha o texto ao lado do ponto
      final textPainter = TextPainter(
        text: TextSpan(text: point.label, style: textStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      // Posiciona o texto ao lado do ponto
      textPainter.paint(
        canvas,
        point.position + Offset(pointSize + 5, -textPainter.height / 2),
      );
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

class Openedanalytics extends StatefulWidget {
  const Openedanalytics({super.key});

  @override
  State<Openedanalytics> createState() => _OpenedanalyticsState();
}

class _OpenedanalyticsState extends State<Openedanalytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 244, 248, 1),
      appBar: PreferredSize(
        preferredSize: Size(70, 70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(999, 76, 175, 80),
          title: Container(
            padding: EdgeInsets.only(top: 20, left: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(right: 25),
                ),
                Text(
                  "Voltar",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 27,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15, top: 50),
              child: Text(
                "Mapa da Análise",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              child: IntensityMap(
                mapImageUrl:
                    'https://maps.googleapis.com/maps/api/staticmap?center=-24.952199,%20-53.575196&zoom=15&size=1600x1200&maptype=satellite&key=AIzaSyCVQmfg0Emt0T_2XVM6UdxynpUVcdkOOZw',
                points: [
                  DataPoint(
                    position: Offset(210, 140),
                    value: 55,
                    label: 'P1',
                  ),
                  DataPoint(
                    position: Offset(180, 195),
                    value: 50,
                    label: 'P2',
                  ),
                  DataPoint(
                    position: Offset(240, 195),
                    value: 50,
                    label: 'P3',
                  ),
                  DataPoint(
                    position: Offset(265, 240),
                    value: 90,
                    label: 'P4',
                  ),
                  DataPoint(
                    position: Offset(170, 240),
                    value: 90,
                    label: 'P5',
                  ),
                  DataPoint(
                    position: Offset(215, 247),
                    value: 70,
                    label: 'P6',
                  ),
                ],
                pointSize: 2,
                influenceRadius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
