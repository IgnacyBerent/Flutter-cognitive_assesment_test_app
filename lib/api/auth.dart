import 'dart:convert';
import 'dart:developer';
import 'package:cognitive_assesment_test_app/api/debug_logs.dart';
import 'package:http/http.dart' as http;
import 'package:cognitive_assesment_test_app/api/jwt.dart';

class Authenticate {
  final String baseUrl = 'https://cognitivegamesbackend.onrender.com';
  final JwtToken jwt = JwtToken();

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.saveTokens(responseBody);
    } else {
      if (response.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else {
        throw Exception('Failed to login');
      }
    }
  }

  Future<void> register(String firstName, String lastName, String username,
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      await login(username, password);
    } else {
      if (response.statusCode == 400) {
        debugLogs(response.statusCode, 201);
        throw Exception('Bad request');
      } else {
        debugLogs(response.statusCode, 201);
        throw Exception('Failed to register');
      }
    }
  }

  Future<void> logout() async {
    await jwt.deleteToken();
  }

  Future<bool> refreshToken() async {
    String? rt = await jwt.getRefreshToken();
    if (rt == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('$baseUrl/refresh_token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'refresh_token': rt}),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.updateToken(responseBody['access_token']);
      return true;
    } else {
      if (response.statusCode == 400) {
        log('Bad request');
        return false;
      } else {
        return false;
      }
    }
  }
}
