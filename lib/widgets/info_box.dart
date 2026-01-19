import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String titulo;
  final String contenido;

  const InfoBox({super.key, required this.titulo, required this.contenido});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(contenido),
          ],
        ),
      ),
    );
  }
}
