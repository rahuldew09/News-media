import 'package:news_media/models/categories_news_model.dart';
import 'package:news_media/models/news_channel_headlines_model.dart';
import 'package:news_media/repository/news_repository.dart';

class NewsViewModel {

  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(String channelName) async{

    final response = await _rep.fetchNewsChannelHeadlinesApi(channelName);
    return response;
  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{

    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}