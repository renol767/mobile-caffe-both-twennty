part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded(this.news);

  @override
  List<Object> get props => [news];
}

class NewsLoadingFailed extends NewsState {
  final String message;

  NewsLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
