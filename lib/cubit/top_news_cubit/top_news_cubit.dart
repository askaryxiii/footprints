import 'package:bloc/bloc.dart';
import 'package:flutter_facebook/Services/top_news_services.dart';
import 'package:flutter_facebook/model/news.dart';
import 'package:meta/meta.dart';

part 'top_news_state.dart';

class TopNewsCubit extends Cubit<TopNewsState> {
  TopNewsCubit(this.newsServices) : super(TopNewsLoading());
  NewsServices newsServices;
  News? newsModel;
  void getNewsApi() async {
    emit(TopNewsLoading());
    try {
      newsModel = await newsServices.getNewsApi();
      emit(TopNewsLoaded());
    } on Exception {
      emit(TopNewsFailure());
    }
  }
}
