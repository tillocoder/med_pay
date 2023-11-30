part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  const AuthInitialState();

  @override
  List<Object?> get props => [];
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState({
    required this.phone,
  });

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object?> get props => [];
}

class AuthPhoneState extends AuthState {
  const AuthPhoneState(this.phone);

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthErrorState extends AuthState {
  const AuthErrorState({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

class AuthCustomerPhone extends AuthState {
  const AuthCustomerPhone();

  @override
  List<Object?> get props => [];
}


class AuthUserNotFound extends AuthState {
  const AuthUserNotFound({required this.phone});
  final String phone;
  @override
  List<Object?> get props => [phone];
}


// enum Status { initial, loading, success, error }
//
// extension StatusX on Status {
//   bool get initial => this == Status.initial;
//
//   bool get isLoading => this == Status.loading;
//
//   bool get isSuccess => this == Status.success;
//
//   bool get isError => this == Status.error;
// }
