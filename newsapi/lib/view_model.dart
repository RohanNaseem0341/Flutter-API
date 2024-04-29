import 'package:my_news_app/news_channel_headline_model.dart';
import 'package:my_news_app/news_repository.dart';

class viewmodel {
  final _rep = newsrepository();
  Future<newschannelheadlinemodel> fetchnewschannel() async {
    final response = await _rep.fetchnewschannel();
    return response;
  }
}
