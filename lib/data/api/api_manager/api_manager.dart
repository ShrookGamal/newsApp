import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/model/articles_response/articles_response.dart';
import 'package:news_app/data/api/model/sources_response/sources_response.dart';

class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _apiKey = 'f6f13a45963140489e21a1f7b9433742';
  static const String sourceEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.http(
        _baseUrl, sourceEndPoint, {'apiKey': _apiKey, 'category': categoryId});
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.http(
        _baseUrl, articlesEndPoint, {'apiKey': _apiKey, 'sources': sourceId});
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
