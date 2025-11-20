import 'package:flutter/material.dart';

typedef WidgetFactory = Widget Function(); // Tipo para crear widgets

// Página que muestra los ejercicios P2 (stateful) con tabs
class StatefulPage extends StatefulWidget {
  final List<WidgetFactory> widgets; // Lista de ejercicios
  final List<String>? labels; // Nombres opcionales para los tabs

  const StatefulPage({super.key, required this.widgets, this.labels});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage>
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
          color: Colors.green, // Color verde para P2
          child: TabBar(
            controller: controller,
            isScrollable: true, // Permite scroll si hay muchos tabs
            tabs: List.generate(
              widget.widgets.length,
              (i) => Tab(text: widget.labels != null && i < widget.labels!.length
                  ? widget.labels![i]
                  : "P2 - ${i + 1}"), // Usa etiqueta personalizada o numeración
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