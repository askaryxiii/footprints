import 'package:bloc/bloc.dart';
import 'package:flutter_facebook/Services/sport_news_services.dart';
import 'package:flutter_facebook/model/news.dart';
import 'package:meta/meta.dart';

part 'sport_news_state.dart';

class SportNewsCubit extends Cubit<SportNewsState> {
  SportNewsCubit(this.sportNewsServices) : super(SportNewsLoading());
 SportNewsServices sportNewsServices;
  News? sportNewsModel;
  void getSportNewsApi() async {
    emit(SportNewsLoading());
    try {
      sportNewsModel = await sportNewsServices.getSportNewsApi();
      emit(SportNewsLoaded());
    } on Exception {
      emit(SportNewsFailure());
    }
  }
}
