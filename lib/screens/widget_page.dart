import 'package:flutter/material.dart';

/// Pantalla amb 2 widgets nous:
/// 1. InteractiveViewer – Zoom i pan
/// 2. Dismissible – Desliza per eliminar + botó per afegir
class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  final List<String> _items = List.generate(3, (i) => 'Element ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InteractiveViewer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. InteractiveViewer
            const Text(
              '1. InteractiveViewer - Zoom i pan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: InteractiveViewer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.cyan],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'ZOOM AQUÍ\n NAVEGA AMB ELS DITS',
                      style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 2. Dismissible
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '2. Dismissible - Desliza per eliminar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _items.add('Element ${_items.length + 1}');
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Afegir Element'),
            ),
            const SizedBox(height: 10),

            // Llista amb Dismissible
            Expanded(
              child: _items.isEmpty
                  ? const Center(
                      child: Text(
                        'No hi ha elements.\nPulsa "Afegir Element"',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return Dismissible(
                          key: Key(item),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              _items.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$item eliminat')),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              leading: const Icon(Icons.drag_handle),
                              title: Text(item),
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