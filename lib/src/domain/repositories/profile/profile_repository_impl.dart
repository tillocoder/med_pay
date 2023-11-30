

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/profile/all_branchs_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/profile/profile_repository.dart';

final class ProfileRepositoryImpl extends ProfileRepository {
  const ProfileRepositoryImpl({
    required this.dio,
  }) : super();

  final Dio dio;



  @override
  Future<Either<Failure, AllBranchsResponse>> getAllBranchs() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.allBranchsUrl,
      );
      return Right(AllBranchsResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}