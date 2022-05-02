part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}
class NewsSuccess extends NewsState {
  @override
  List<Object> get props => [];
}
class NewsFailure extends NewsState {
  final String errorMessage;

  const NewsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
