part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetAllBranchsEvent extends ProfileEvent{
  const GetAllBranchsEvent();

  @override
  List<Object?> get props => [];
}