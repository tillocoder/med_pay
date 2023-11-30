import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/confirm_login/confirm_login.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/confirm_login/confirm_login_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/customer_login_request/customer_login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/customer_phone_response/customer_phone_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/send_message_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/custom_register_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';

part 'auth_repository_impl.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<Either<Failure, CustomerPhoneResponse>> checkPhoneIsSignedUp({
    required VerifyRequest request,
  });

  Future<Either<Failure, ConfirmLoginResponse>> sendCode({
    required ConfirmLoginRequest request,
  });

  // Future<Either<Failure, CustomerPhoneResponse>> verifySmsCode({
  //   required VerifyRequest request,
  //   required String smsId,
  //   required String otp,
  // });


  Future<Either<Failure, CustommerLoginResponse>> customerLogin({
    required CustomerLoginRequest request,
  });



}
