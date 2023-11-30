

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/custom_register_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_model.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/register/register_repository.dart';



final class RegisterRepositoryImpl extends RegisterRepository {
  const RegisterRepositoryImpl({
    required this.dio,
  }) : super();

  final Dio dio;



  @override
  Future<Either<Failure, ConfirmRegisterResponse>> customerRegister(
      {required ConfirmRegisterResponse request}) async {
    try {
      final response = await dio.post(
        Constants.baseUrl + Urls.customerResgisterUrl,
        data: request.toJson(),
        options: Options(
          headers: {
            'Shipper': Constants.shipperId,
          },
        ),
      );
      return Right(
        ConfirmRegisterResponse.fromJson(response.data),
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
  Future<Either<Failure, ConfirmRegisterResponse>> confirmRegister({
    required ConfirmRegisterRequest request,
  }) async {
    try {
      final String platformId = Platform.isIOS
          ? Constants.platformIdIos
          : Constants.platformIdAndroid;
      final response = await dio.post(
        Constants.baseUrl + Urls.confirmRegister,
        data: request.toJson(),
        options: Options(
          headers: {
            'Shipper': Constants.shipperId,
            'Platform': platformId,
          },
        ),
      );
      return Right(
        ConfirmRegisterResponse.fromJson(response.data),
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
