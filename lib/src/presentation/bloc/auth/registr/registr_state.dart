part of 'registr_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}


class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();

  @override
  List<Object?> get props => [];
}

class RegisterSuccesState extends RegisterState {
  const RegisterSuccesState({required this.userName,required this.phone});
  final String userName;
  final String phone;
  @override
  List<Object?> get props => [userName,phone];
}

class RegisterErrorState extends RegisterState {
  const RegisterErrorState({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

class RegisterConfirmSuccess extends RegisterState{
  const RegisterConfirmSuccess({required this.phone,required this.name});
  final String phone;
  final String name;

  @override
  List<Object?> get props => [phone,name];

}