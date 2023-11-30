part of 'home_repository.dart';

final class HomeRepositoryImpl extends HomeRepository {
  const HomeRepositoryImpl({
    required this.dio,
  }) : super();

  final Dio dio;

  @override
  Future<Either<Failure, CategoryWithProductResponse>> getCategory() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Constants.categoryWithProductUrl,
      );
      return Right(CategoryWithProductResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, BannerResponse>> getBanner() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Constants.bannerUrl,
      );
      return Right(
        BannerResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }


  @override
  Future<Either<Failure,AllProductResponse>> getAllProducts()async{
    try{
      final response=await dio.get(
        Constants.baseUrl+Urls.allProductUrl,
      );
      return Right(AllProductResponse.fromJson(response.data),);
    }on DioException catch(e,s){
      log('Exception occurred: $e stacktrace: $s');
      return Left(ServerError.withDioError(error: e).failure);
    }on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}
