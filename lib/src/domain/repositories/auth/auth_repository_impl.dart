part of 'auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  const AuthRepositoryImpl({
    required this.dio,
  }) : super();

  final Dio dio;

  @override
  Future<Either<Failure, CustomerPhoneResponse>> checkPhoneIsSignedUp({
    required VerifyRequest request,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.customerPhone,
        data: request.toJson(),
      );
      return Right(CustomerPhoneResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, CustommerLoginResponse>> customerLogin({
    required CustomerLoginRequest request,
  }) async {
    try {
      final response = await dio.post(
        Constants.baseUrl + Urls.loginCustomer,
        data: request.toJson(),
        options: Options(
          headers: {
            'Shipper': Constants.shipperId,
          },
        ),
      );
      return Right(
        CustommerLoginResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log('Exception occured $error stacktrace $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, ConfirmLoginResponse>> sendCode({
    required ConfirmLoginRequest request,
  }) async {
    try {
      final String platformId = Platform.isIOS
          ? Constants.platformIdIos
          : Constants.platformIdAndroid;
      final response = await dio.post(
        Constants.baseUrl + Urls.confirmLogin,
        data: request.toJson(),
        options: Options(
          headers: {
            'Shipper': Constants.shipperId,
            'Platform': platformId,
          },
        ),
      );
      return Right(
        ConfirmLoginResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log('Exception occured $error stacktrace $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occured: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }





}
