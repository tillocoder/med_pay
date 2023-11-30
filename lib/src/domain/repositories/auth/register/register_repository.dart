import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/custom_register_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_model.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';

abstract class RegisterRepository {
  const RegisterRepository();

  Future<Either<Failure, ConfirmRegisterResponse>> customerRegister(
      {required ConfirmRegisterResponse
      request});


  // Future<Either<Failure, ConfirmRegisterRequest>> confirmRegister(
  //     {required ConfirmRegisterRequest
  //     request});


  Future<Either<Failure, ConfirmRegisterResponse>> confirmRegister(
      {required ConfirmRegisterRequest request});
}
