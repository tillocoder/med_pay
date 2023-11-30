part of 'registr_bloc.dart';

abstract class RegistrEvent extends Equatable {
  const RegistrEvent();
}
class RegisterEventInitial extends RegistrEvent {
  const RegisterEventInitial();

  @override
  List<Object?> get props => [];
}

class RegisterCheckEvent extends RegistrEvent{
 const RegisterCheckEvent({required this.userName,required this.phone});
  final String userName;
  final String phone;

  @override
  List<Object?> get props => [userName,phone];
}

class RegisterConfirmEvent extends RegistrEvent {
  const RegisterConfirmEvent({required this.phone,required this.name});
  final String phone;
  final String name;

  @override
  List<Object?> get props => [name,phone];
}
