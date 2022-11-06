part of 'top_news_cubit.dart';

@immutable
abstract class TopNewsState {}

class TopNewsLoading extends TopNewsState {}

class TopNewsLoaded extends TopNewsState {}

class TopNewsFailure extends TopNewsState {}
