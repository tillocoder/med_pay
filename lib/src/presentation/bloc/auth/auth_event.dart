part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthEventInitial extends AuthEvent {
  const AuthEventInitial();

  @override
  List<Object?> get props => [];
}

class AuthPhoneChangeEvent extends AuthEvent {
  const AuthPhoneChangeEvent(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class AuthCheckMessageEvent extends AuthEvent {
  const AuthCheckMessageEvent(this.phone, this.context);

  final String phone;
  final BuildContext context;

  @override
  List<Object?> get props => [phone, context];
}


class AuthSendMessageEvent extends AuthEvent{
  const AuthSendMessageEvent({required this.phone});
  final String phone;
  @override
  List<Object?> get props => [phone];

}