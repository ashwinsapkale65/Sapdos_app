import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sapdos_app/features/onboarding/register/domain/entities/user_entity.dart';

class CustomAPIClient {
  final String baseUrl;

  CustomAPIClient({required this.baseUrl});

  Future<dynamic> post(String endpoint, dynamic data) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody;
    } else if (response.statusCode == 406) {
      throw Exception('Email already exists. Please use a different email.');
    } else {
      throw Exception(
          'Failed to make request. Server responded with status code ${response.statusCode}');
    }
  }
}
