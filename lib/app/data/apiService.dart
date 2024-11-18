// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihanpas/app/models/premModel.dart';


class ApiService {
    final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<Team>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> data = json['teams'];
      return data.map((data) => Team.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}