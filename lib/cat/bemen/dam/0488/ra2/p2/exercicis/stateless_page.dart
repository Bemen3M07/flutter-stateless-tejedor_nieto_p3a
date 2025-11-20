import 'package:flutter/material.dart';

typedef WidgetFactory = Widget Function();

class StatelessPage extends StatefulWidget {
  final List<WidgetFactory> widgets;
  final List<String>? labels;

  const StatelessPage({super.key, required this.widgets, this.labels});

  @override
  State<StatelessPage> createState() => _StatelessPageState();
}

class _StatelessPageState extends State<StatelessPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.widgets.length, vsync: this);
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
          color: Colors.blue,
          child: TabBar(
            controller: controller,
            isScrollable: true,
            tabs: List.generate(
              widget.widgets.length,
              (i) => Tab(text: widget.labels != null && i < widget.labels!.length
                  ? widget.labels![i]
                  : "P3 - ${i + 1}"),
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
                    child: const Text("Obrir exercici"),
                    onPressed: () {
                      Navigator.push(
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