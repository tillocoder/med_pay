import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/themes/themes.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/confirm_register_request.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/custom_register_response.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_model.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/register/register_repository.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/auth/regstr/register_items_model.dart';

part 'registr_event.dart';

part 'registr_state.dart';

class RegisterBloc extends Bloc<RegistrEvent, RegisterState> {
  RegisterBloc(this.registerRepository) : super(RegisterInitial()) {
    on<RegisterCheckEvent>(_onSendMessage);
    on<RegisterConfirmEvent>(_customerRegister);
  }

  final RegisterRepository registerRepository;

  Future<void> _onSendMessage(
      RegisterCheckEvent event, Emitter<RegisterState> emit) async {
    emit(
      const RegisterLoadingState(),
    );
    final result = await registerRepository.customerRegister(
      request: ConfirmRegisterResponse(
        phone: '+998${event.phone.replaceAll(' ', '')}',
        name: event.userName.replaceAll(' ', ''),
      ),
    );
    result.fold((l) {
      final exception = (l as ServerFailure).message;
      emit(
        RegisterErrorState(message: exception),
      );
    }, (r) {
      emit(
        RegisterSuccesState(userName: event.userName, phone: event.phone),
      );
    },
    );
  }

  Future<void> _customerRegister(
      RegisterConfirmEvent event, Emitter<RegisterState> emit) async {
    debugPrint('lalala2');
    emit(const RegisterLoadingState());
    final result = await registerRepository.confirmRegister(
      request: ConfirmRegisterRequest(
          phone: '+998${event.phone.replaceAll(' ', '')}', code: event.name),
    );
    debugPrint('lalala3');
    result.fold(
      (l) {
        debugPrint('lalala4');
        final exception = (l as ServerFailure).message;
        emit(
          RegisterErrorState(message: exception),
        );
      },
      (r) {
        debugPrint('lalala5');
        if (r.name != null && r.phone != null) {
          emit(
            RegisterConfirmSuccess(name: r.name.toString(), phone: r.phone!),
          );
        }
      },
    );
  }
}
