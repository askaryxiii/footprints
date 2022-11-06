part of 'health_news_cubit.dart';

@immutable
abstract class HealthNewsState {}

class HealthNewsLoading extends HealthNewsState {}

class HealthNewsLoaded extends HealthNewsState {}

class HealthNewsFailure extends HealthNewsState {}
