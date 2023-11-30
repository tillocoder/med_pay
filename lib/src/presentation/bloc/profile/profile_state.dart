part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState{
  const ProfileLoading();
  @override
  List<Object> get props => [];
}
class ProfileError extends ProfileState{
  const ProfileError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
class ProfileSuccess extends ProfileState{
  const ProfileSuccess({required this.allBranchs});
  final AllBranchsResponse allBranchs;
  @override
  List<Object> get props => [allBranchs];
}
