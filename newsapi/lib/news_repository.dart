import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_news_app/news_channel_headline_model.dart';

class newsrepository {
  Future<newschannelheadlinemodel> fetchnewschannel() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=460a3cb495314c948f25d14c0f5ce3f6";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return newschannelheadlinemodel.fromJson(body);
    }
    throw Exception("Error");
  }
}
