import 'package:flutter/material.dart';

typedef WidgetFactory = Widget Function(); // Tipo para crear widgets

// Página que muestra los ejercicios P3 (stateless) con tabs
class StatelessPage extends StatefulWidget {
  final List<WidgetFactory> widgets; // Lista de ejercicios
  final List<String>? labels; // Nombres opcionales para los tabs

  const StatelessPage({super.key, required this.widgets, this.labels});

  @override
  State<StatelessPage> createState() => _StatelessPageState();
}

class _StatelessPageState extends State<StatelessPage>
    with SingleTickerProviderStateMixin {
  late TabController controller; // Controlador de las pestañas

  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.widgets.length, vsync: this); // Crea tabs según número de ejercicios
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.blue, // Color azul para P3
          child: TabBar(
            controller: controller,
            isScrollable: true, // Permite scroll si hay muchos tabs
            tabs: List.generate(
              widget.widgets.length,
              (i) => Tab(text: widget.labels != null && i < widget.labels!.length
                  ? widget.labels![i]
                  : "P3 - ${i + 1}"), // Usa etiqueta personalizada o numeración
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: widget.widgets.map(
              (factory) {
                return Center(
                  child: ElevatedButton(
                    child: const Text("Obrir exercici"), // Texto del botón
                    onPressed: () {
                      Navigator.push( // Abre el ejercicio en nueva pantalla
                        context,
                        MaterialPageRoute(builder: (_) => factory()),
                      );
                    },
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}