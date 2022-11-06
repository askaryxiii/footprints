import 'package:flutter_facebook/model/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsServices {
  Future<News> getNewsApi() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=5b00498f76da4f8b9ca3c9f751a924cb');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    News news = News.fromJson(data);

    return news;
  }
}
