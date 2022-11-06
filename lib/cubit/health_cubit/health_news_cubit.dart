import 'package:bloc/bloc.dart';
import 'package:flutter_facebook/Services/health_news_services.dart';
import 'package:flutter_facebook/model/news.dart';
import 'package:meta/meta.dart';

part 'health_news_state.dart';

class HealthNewsCubit extends Cubit<HealthNewsState> {
  HealthNewsCubit(this.healthNewsServices) : super(HealthNewsLoading());
 HealthNewsServices healthNewsServices;
  News? healthNewsModel;
  void getHealthNews() async {
    emit(HealthNewsLoading());
    try {
      healthNewsModel = await healthNewsServices.getHealthNewsApi();
      emit(HealthNewsLoaded());
    } on Exception {
      emit(HealthNewsFailure());
    }
  }
}
