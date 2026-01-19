import 'package:flutter/material.dart';
import 'widgets/info_box.dart'; // widget personalizado (stateless)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool descargado = false; // ESTADO LOCAL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currículum"), centerTitle: true),

      // LISTVIEW requerido
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // ===================== PARTE SUPERIOR =====================
          Row(
            children: [
              // STACK (requisito)
              Stack(
                children: [
                  Image.asset('assets/img/foto.jpg', width: 80, height: 80),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.edit, size: 18),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Juan Pérez",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  Text("Desarrollador Flutter"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ===================== PARTE INFERIOR =====================
          Row(
            children: [
              // --------- COLUMNA IZQUIERDA ---------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoBox(
                      titulo: "Experiencia",
                      contenido: "2 años como programador en Empresa X.",
                    ),
                    SizedBox(height: 10),
                    InfoBox(
                      titulo: "Estudios",
                      contenido: "Grado en Desarrollo de Aplicaciones.",
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // --------- COLUMNA DERECHA ---------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    InfoBox(
                      titulo: "Habilidades",
                      contenido: "Flutter, Dart, UI básica, Git.",
                    ),
                    SizedBox(height: 10),
                    InfoBox(titulo: "Contacto", contenido: "email@correo.com"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ===================== BOTÓN STATEFUL =====================
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  descargado = !descargado;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: descargado ? Colors.green : Colors.blue,
              ),
              child: Text(
                descargado ? "CV descargado" : "Descargar CV",
              ), // cambia texto
            ),
          ),
        ],
      ),
    );
  }
}
