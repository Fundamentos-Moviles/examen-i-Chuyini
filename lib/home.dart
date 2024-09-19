import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> birthdayList = [
    {'id': 7, 'name': 'Alejandro Ordaz', 'birthdate': '23 de Marzo', 'description': 'Cumpleaños del profesor', 'stars': 5},
    {'id': 8, 'name': 'Alejandro Ordaz', 'birthdate': '29 de Abril', 'description': 'Cumpleaños de mi mejor amiga', 'stars': 4},
    {'id': 9, 'name': 'Alejandro Ordaz', 'birthdate': '03 de Octubre', 'description': 'Cumpleaños del profesor', 'stars': 3},
    {'id': 10, 'name': 'Alejandro Ordaz', 'birthdate': '20 de Diciembre', 'description': 'Cumpleaños del profesor', 'stars': 3},
    {'id': 11, 'name': 'Alejandro Ordaz', 'birthdate': '14 de Enero', 'description': 'Cumpleaños de mi madre', 'stars': 4},
    {'id': 12, 'name': 'Alejandro Ordaz', 'birthdate': '18 de Febrero', 'description': 'Cumpleaños del primo', 'stars': 2},
    {'id': 13, 'name': 'Alejandro Ordaz', 'birthdate': '12 de Marzo', 'description': 'Cumpleaños del padre', 'stars': 4},
    {'id': 14, 'name': 'Alejandro Ordaz', 'birthdate': '06 de Julio', 'description': 'Cumpleaños del hermano', 'stars': 5},
    {'id': 15, 'name': 'Alejandro Ordaz', 'birthdate': '01 de Septiembre', 'description': 'Cumpleaños del profesor', 'stars': 5},
    {'id': 16, 'name': 'Alejandro Ordaz', 'birthdate': '30 de Noviembre', 'description': 'Cumpleaños del compañero', 'stars': 3},
    {'id': 17, 'name': 'Alejandro Ordaz', 'birthdate': '17 de Junio', 'description': 'Cumpleaños de la hermana', 'stars': 4},
    {'id': 18, 'name': 'Alejandro Ordaz', 'birthdate': '25 de Agosto', 'description': 'Cumpleaños del tío', 'stars': 2},
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
    if ([7, 10, 15].contains(item['id'])) { // Solo IDs especificados como protegidos.
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
      appBar: AppBar(
        title: Text('Notificaciones de actividades'),
        backgroundColor: Color(0xff520101),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: birthdayList.length,
        itemBuilder: (context, index) {
          final item = birthdayList[index];
          return Card(
            color: Color(0xff640101),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: ([7, 10, 15].contains(item['id'])) ? Colors.yellow : Colors.grey,
              ),
              title: Text(
                '${item['birthdate']}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    item['description'],
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < item['stars'] ? Icons.star : Icons.star_border,
                        color: i < item['stars'] ? Colors.yellow : Colors.grey,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
              trailing: ElevatedButton.icon(
                onPressed: () => deleteItem(index),
                icon: Icon(Icons.delete, color: Colors.white),
                label: Text('Borrar'),
                style: ElevatedButton.styleFrom(

                ),
              ),
              onTap: () => showInfo(index),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'SEGUNDA VISTA: LARA VAZQUEZ JESUS MANUEL',
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Color(0xff410101), // Color de fondo de la vista
    );
  }
}

