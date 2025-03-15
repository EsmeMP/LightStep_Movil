import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:light_step_app/models/configuracion_model.dart';

class LightstepService {
  static final LightstepService _instance = LightstepService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory LightstepService() {
    return _instance;
  }

  LightstepService._internal();

  Stream<List<ConfiguracionModel>> getConfiguracion(String collection) {
    return _firestore.collection(collection).snapshots().map((snapshot) {
      final configuracion = snapshot.docs
          .map((doc) {
            try {
              final config = ConfiguracionModel.fromDocumentSnapshot(doc);
              print(
                  'Configuración recibida: ${config.nombre}, Color: ${config.color}');
              return config;
            } catch (e) {
              print('Error al procesar documento: ${doc.id}, Error: $e');
              return null;
            }
          })
          .where((config) => config != null)
          .cast<ConfiguracionModel>()
          .toList();

      print('Total configuraciones: ${configuracion.length}');
      return configuracion;
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LightstepService service = LightstepService();

  service.getConfiguracion('configuracion').listen((configuracion) {
    print('Recibidas ${configuracion.length} configuraciones');
    for (var config in configuracion) {
      print(
          'ID: ${config.id}, Nombre: ${config.nombre}, Color: ${config.color}');
    }
  });
}
