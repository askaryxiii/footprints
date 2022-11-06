import 'package:bloc/bloc.dart';
import 'package:flutter_facebook/Services/business_news_services.dart';
import 'package:flutter_facebook/model/news.dart';
import 'package:meta/meta.dart';

part 'business_news_state.dart';

class BusinessNewsCubit extends Cubit<BusinessNewsState> {
  BusinessNewsCubit(this.businessNewsServices) : super(BusinessNewsLoading());
  BusinessNewsServices businessNewsServices;
  News? businessNewsModel;
  void getBusinessNewsApi() async {
    emit(BusinessNewsLoading());
    try {
      businessNewsModel = await businessNewsServices.getBusinessNewsApi();
      emit(BusinessNewsLoaded());
    } on Exception {
      emit(BusinessNewsFailure());
    }
  }
}
