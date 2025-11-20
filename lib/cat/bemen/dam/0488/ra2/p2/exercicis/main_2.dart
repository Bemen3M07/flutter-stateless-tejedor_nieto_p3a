import 'package:flutter/material.dart';

// Widget con estado para manejar el input del usuario
class Ex22SayHello extends StatefulWidget {
  const Ex22SayHello({super.key});

  @override
  State<Ex22SayHello> createState() => _Ex22SayHelloState();
}

class _Ex22SayHelloState extends State<Ex22SayHello> {
  final TextEditingController _nameCtrl = TextEditingController(); // Controlador del input
  String _helperText = ''; // mensaje de ayuda/validación opcional

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _sayHello() {
    final name = _nameCtrl.text.trim();

    if (name.isEmpty) {
      // Actualizamos estado para mostrar mensaje de ayuda (opcional)
      setState(() => _helperText = 'Introdueix un nom'); // o 'Introduce un nombre'
      return;
    }

    // Si hay texto válido, mostramos un diálogo de bienvenida
    showDialog( // Abre ventana emergente
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Benvingut / Bienvenido'),
        content: Text('Hola, $name!'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );

    // Opcional: limpiar el campo y helper después de mostrar diálogo
    setState(() {
      _helperText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ex 2.2 – Say Hello')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: 'Nom / Nombre',
                hintText: 'Introdueix el teu nom',
                helperText: _helperText.isEmpty ? null : _helperText,
                border: const OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _sayHello(), // permite enviar con Enter
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _sayHello,
              child: const Text('Say Hello'),
            ),
          ],
        ),
      ),
    );
  }
}