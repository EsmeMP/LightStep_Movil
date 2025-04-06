import 'package:firebase_database/firebase_database.dart';

class LightstepService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  /// Obtener la configuración en tiempo real desde Realtime Database
  Stream<Map<String, dynamic>> getConfiguracion() {
    return _database.child("config").onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        // Asegúrate de convertir el tipo a Map<String, dynamic>
        return Map<String, dynamic>.from(data);
      } else {
        // Retorna un mapa vacío en caso de no encontrar datos
        return {};
      }
    });
  }

  /// Actualizar la configuración en Realtime Database
  Future<void> updateConfiguracion({
    required String efecto,
    required String estado,
    required String fecha,
    required int opacidad,
    required String id,
    required String color,
  }) async {
    try {
      await _database.child("config").update({
        "efecto": efecto,
        "estado": estado,
        "fecha": fecha,
        "opacidad": opacidad,
        "id": id,
        "color": color,
      });
      print("Configuración actualizada en Realtime Database");
    } catch (e) {
      print("Error al actualizar configuración: $e");
      // Considera lanzar un error o manejarlo de forma adecuada.
    }
  }
}
