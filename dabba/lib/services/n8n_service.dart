import 'dart:convert';
import 'package:http/http.dart' as http;

class N8nService {
  static const String baseUrl =
      'YOUR_N8N_WEBHOOK_URL'; // Remplacez par votre URL n8n.io

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': message,
          'timestamp': DateTime.now().toIso8601String(),
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['response'] ??
            "Désolé, je n'ai pas pu traiter votre demande.";
      } else {
        throw Exception('Erreur du serveur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur de communication: $e');
    }
  }
}
