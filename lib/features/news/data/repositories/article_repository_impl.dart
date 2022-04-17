import 'package:dartz/dartz.dart';
import 'package:zagel_news_app/core/exceptions/exceptions.dart';
import 'package:zagel_news_app/core/exceptions/failure.dart';
import 'package:zagel_news_app/core/platform/network_info.dart';
import 'package:zagel_news_app/features/news/data/data_sources/article_locale_data_source.dart';
import 'package:zagel_news_app/features/news/data/data_sources/article_remote_data_source.dart';
import 'package:zagel_news_app/features/news/domain/entities/article_entity.dart';
import 'package:zagel_news_app/features/news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;
  final ArticleLocaleDataSource localeDataSource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImpl({
    required this.remoteDataSource,
    required this.localeDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticleByCategory(
      category_type category) async {
    await networkInfo.isConnected;
    try {
      final articlesList =
          await remoteDataSource.getArticleByCategory(category);
      localeDataSource.cacheArticleLocale(articlesList);
      return Right(articlesList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticleByQuery(String query) {
    // TODO: implement getArticleByQuery
    throw UnimplementedError();
  }
}
