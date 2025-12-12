import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

Future<void> saveContactSubmission({
  required String name,
  required String email,
  required String message,
  required String subject,
}) async {
  try {
    final submissionData = {
      'name': name,
      'email': email,
      'message': message,
      'subject': subject,
      'timestamp': FieldValue.serverTimestamp(),
      'is_read': false,
    };

    await _db.collection('contact_submissions').add(submissionData);

    debugPrint('Datos del formulario guardados con éxito en Firestore.');
  } on FirebaseException catch (e) {
    debugPrint('Error al guardar en Firestore: ${e.code}');
    throw Exception('Error al guardar el formulario: ${e.message}');
  } catch (e) {
    debugPrint('Error desconocido: $e');
    throw Exception('Ocurrió un error inesperado al guardar.');
  }
}
