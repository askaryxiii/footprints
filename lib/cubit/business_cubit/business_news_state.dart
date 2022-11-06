part of 'business_news_cubit.dart';

@immutable
abstract class BusinessNewsState {}

class BusinessNewsLoading extends BusinessNewsState {}

class BusinessNewsLoaded extends BusinessNewsState {}

class BusinessNewsFailure extends BusinessNewsState {}
