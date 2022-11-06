part of 'sport_news_cubit.dart';

@immutable
abstract class SportNewsState {}

class SportNewsLoading extends SportNewsState {}

class SportNewsLoaded extends SportNewsState {}

class SportNewsFailure extends SportNewsState {}
