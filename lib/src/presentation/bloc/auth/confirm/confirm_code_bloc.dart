import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/mixin/cache_mixin.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/auth/confirm_login/confirm_login.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/auth_repository.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/register/register_repository.dart';
import 'package:sample_bloc_mobile/src/presentation/components/snack/snack.dart';

part 'confirm_code_state.dart';

part 'confirm_code_event.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  ConfirmCodeBloc(this.authRepository, this.registerRepository)
      : super(
          const ConfirmInitialState(),
        ) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
    on<ConfirmCodeRegisterEvent>(_onRegisterConfirm);
  }

  final AuthRepository authRepository;
  final RegisterRepository registerRepository;

  Future<void> _onConfirmCode(ConfirmCodeCheckMessageEvent event,
      Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeLoadingState());
    final result = await authRepository.sendCode(
      request: ConfirmLoginRequest(
          phone: '+998${event.phone.replaceAll(' ', '')}', code: event.code),
    );
    result.fold(
      (l) {
        final exception = (l as ServerFailure).message;
        emit(
          ConfirmCodeErrorState(message: exception),
        );
      },
      (r) {
        emit(
          const ConfirmLoginSuccess(),
        );
      },
    );
  }

  Future<void> _onRegisterConfirm(
      ConfirmCodeRegisterEvent event, Emitter<ConfirmCodeState> emit) async {
    emit(
      const ConfirmCodeLoadingState(),
    );

    final result = await registerRepository.confirmRegister(
      request: ConfirmRegisterRequest(
          phone: '+998${event.phone.replaceAll(' ', '')}', code: event.code),
    );
    result.fold((l) {
      final exception = (l as ServerFailure).message;
      emit(
        ConfirmCodeErrorState(message: exception),
      );
    }, (r) {
      if (r.name != null && r.phone != null) {
        emit(
          ConfirmSuccess(phone: r.phone!, name: r.name!),
        );
      } else {
        const ConfirmCodeErrorState(message: 'Somethings wrong');
      }
    });
  }
}
