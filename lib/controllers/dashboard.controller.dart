import 'package:flutter/material.dart';

class DashboardController with ChangeNotifier {
  String _role = '';
  List<String> itemsCrop = [
    'Aguacate Hass',
    'Tomate de árbol',
    'Lulo',
    'Fresa',
    'Cilantro',
    'Mora',
    'Pimiento',
    'Café',
    'Cebolla larga',
    'Plátano'
  ];
  List<String> itemsCity = [
    'Santa Elena',
    'Guarne',
    'Rionegro',
    'El Retiro',
    'La Ceja',
    'Marinilla',
    'Caldas',
    'San Antonio de Prado',
    'Copacabana',
    'Girardota'
  ];
  Size size = const Size(0, 0);
  String get role => _role;

  set role(String value) {
    _role = value;
    notifyListeners();
  }

  String getListTitle() {
    if (_role == 'cultivador') return 'Mis Cultivos';
    if (_role == 'inversionista') return 'Mis Inversiones';
    return 'Mis Proyectos';
  }

  String getCreateButtonText() {
    if (_role == 'cultivador') return 'Crear Cultivo';
    if (_role == 'inversionista') return 'Invertir';
    return 'Crear Proyecto';
  }

  void handleCreateAction(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Crear nuevo'),
          content: Text(
            'Aquí se abre el formulario para crear un nuevo ${getCreateButtonText().toLowerCase()}',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void showDetailModal(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detalle de ${getListTitle()}'),
          content: Text('Este es el detalle del ${getListTitle()} $index'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
