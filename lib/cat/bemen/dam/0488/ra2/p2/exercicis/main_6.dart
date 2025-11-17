import 'package:flutter/material.dart';

/// Exercici 2.6 – Shopping List (versió millorada)
///
/// Afegim:
///   ✔ Icones per a cada producte
///   ✔ Diàleg per confirmar l'eliminació
///   ✔ Estat amb llista de productes (nom + quantitat)
///

class Ex26ShoppingListIconsDialog extends StatefulWidget {
  const Ex26ShoppingListIconsDialog({super.key});

  @override
  State<Ex26ShoppingListIconsDialog> createState() =>
      _Ex26ShoppingListIconsDialogState();
}

class _Ex26ShoppingListIconsDialogState
    extends State<Ex26ShoppingListIconsDialog> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _qtyCtrl = TextEditingController();

  // Llista de productes [{name: "...", qty: "..."}]
  final List<Map<String, String>> _items = [];

  /// Afegir producte
  void _addItem() {
    final name = _nameCtrl.text.trim();
    final qty = _qtyCtrl.text.trim();

    if (name.isEmpty || qty.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Omple tots els camps')),
      );
      return;
    }

    setState(() {
      _items.add({'name': name, 'qty': qty});
    });

    _nameCtrl.clear();
    _qtyCtrl.clear();
  }

  /// Mostrar diàleg de confirmació abans d'eliminar
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar element'),
          content: const Text('Estàs segur que vols eliminar aquest producte?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Tancar
              child: const Text('Cancel·lar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tancar diàleg
                _removeItem(index); // Eliminar producte
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  /// Elimina un element
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  /// Assigna icones segons el nom del producte (simple i visual)
  Icon _iconForProduct(String name) {
    final lower = name.toLowerCase();

    if (lower.contains('poma') || lower.contains('manzana')) {
      return const Icon(Icons.apple, color: Colors.red);
    }
    if (lower.contains('pa') || lower.contains('pan')) {
      return const Icon(Icons.bakery_dining, color: Colors.brown);
    }
    if (lower.contains('aigua') || lower.contains('agua')) {
      return const Icon(Icons.local_drink, color: Colors.blue);
    }
   if (lower.contains('llet') || lower.contains('leche')) {
  return const Icon(Icons.local_cafe, color: Colors.purple);
}

return const Icon(Icons.shopping_cart);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ex 2.6 – Shopping list millorada')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Formulari d'entrada
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nom del producte',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _qtyCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantitat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Afegir'),
            ),

            const SizedBox(height: 16),

            /// Llista d'elements
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  final name = item['name']!;
                  final qty = item['qty']!;

                  return Card(
                    child: ListTile(
                      leading: _iconForProduct(name),
                      title: Text(name),
                      subtitle: Text('Quantitat: $qty'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmDelete(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}