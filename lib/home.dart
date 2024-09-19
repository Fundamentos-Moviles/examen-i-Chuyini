import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> birthdayList = [
    {'id': 1, 'name': 'Alejandro Ordaz', 'birthdate': '23 de Marzo', 'description': 'Cumpleaños del profesor', 'stars': 5},
    {'id': 2, 'name': 'Luis Torres', 'birthdate': '15 de Abril', 'description': 'Cumpleaños de amigo', 'stars': 3},
    // Aquí agregar los demás elementos de la lista
  ];

  void showInfo(int index) {
    final item = birthdayList[index];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ID: ${item['id']} \nFecha de nacimiento: ${item['birthdate']} \nNombre completo: ${item['name']}'),
      ),
    );
  }

  void deleteItem(int index) {
    final item = birthdayList[index];
    if ([1, 10, 15, 20, 23].contains(item['id'])) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se puede eliminar el elemento con ID: ${item['id']}')),
      );
    } else {
      setState(() {
        birthdayList.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Elemento con ID: ${item['id']} eliminado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendario de Cumpleaños')),
      body: ListView.builder(
        itemCount: birthdayList.length,
        itemBuilder: (context, index) {
          final item = birthdayList[index];
          return ListTile(
            leading: Icon(
              Icons.cake,
              color: ([1, 5, 10, 15].contains(item['id'])) ? Colors.yellow : Colors.grey,
            ),
            title: Text(item['name']),
            subtitle: Text(item['birthdate']),
            onTap: () => showInfo(index),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteItem(index),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Alumno: TU NOMBRE COMPLETO',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
