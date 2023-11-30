part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeEvent extends Equatable {
  const ConfirmCodeEvent();
}

class ConfirmCodeEventInitial extends ConfirmCodeEvent {
  const ConfirmCodeEventInitial();

  @override
  List<Object?> get props => [];
}

class ConfirmCodePhoneChangeEvent extends ConfirmCodeEvent {
  const ConfirmCodePhoneChangeEvent(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class ConfirmCodeCheckMessageEvent extends ConfirmCodeEvent {
  const ConfirmCodeCheckMessageEvent({
    required this.code,
  required this.phone,
  });


  final String phone;
 final String code;
  @override
  List<Object?> get props => [phone,code];
}


class ConfirmCodeRegisterEvent extends ConfirmCodeEvent{
  const ConfirmCodeRegisterEvent({required this.phone,required this.code});
  final String phone;
  final String code;
  @override
  List<Object?> get props => [code,phone];

}