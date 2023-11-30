import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/customer_login_request/customer_login_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/customer_phone_response/customer_phone_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/auth_repository.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthInitialState()) {
    on<AuthPhoneChangeEvent>(_onChanged);
    on<AuthCheckMessageEvent>(_onCheckPhone);
    on<AuthSendMessageEvent>(_onSendMessage);
  }

  final AuthRepository authRepository;

  void _onChanged(AuthPhoneChangeEvent event, Emitter<AuthState> emit) {
    if (event.value.length <= 11) {
      emit(const AuthInitialState());
      return;
    }
    emit(AuthPhoneState(event.value));
  }

  Future<void> _onCheckPhone(
    AuthCheckMessageEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());

    final Either<Failure, CustomerPhoneResponse> result =
        await authRepository.checkPhoneIsSignedUp(
      request: VerifyRequest(
        phone: '+998${event.phone.replaceAll(' ', '')}',
      ),
    );
    result.fold(
      (l) {
        final int? exception = (l as ServerFailure).statusCode;
        if (exception == 404) {
          emit(AuthUserNotFound(phone: event.phone.replaceAll(' ', '')));
        } else {
          emit(AuthErrorState(message: l.message));
        }
      },
      (r) {
        if (r.phone != null) {
          emit(
            const AuthCustomerPhone(),
            // AuthSuccessState(phone: r.phone!),
          );
        } else {
          emit(
            const AuthErrorState(message: 'Nimadir xato'),
          );
        }
      },
    );
  }

  Future<void> _onSendMessage(
      AuthSendMessageEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final result = await authRepository.customerLogin(
      request:
          CustomerLoginRequest(phone: '+998${event.phone.replaceAll(' ', '')}'),
    );
    result.fold((l) {
      final exception = (l as ServerFailure).message;
      emit(
        AuthErrorState(message: exception),
      );
    }, (r) {
      if (r.message != null) {
        debugPrint('akskjs');
        emit(
          AuthSuccessState(phone:event.phone.replaceAll(' ', '')),
        );
      } else {
        emit(
          const AuthErrorState(message: 'Nimadir xato'),
        );
      }
    });
  }
}
