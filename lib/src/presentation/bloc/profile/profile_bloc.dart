
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/data/models/profile/all_branchs_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/profile/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(const ProfileInitial()) {
    on<GetAllBranchsEvent>((event, emit)async {
      emit(
        const ProfileLoading(),
      );
      final result = await profileRepository.getAllBranchs();
      result.fold(
            (left) {
              final exception = (left as ServerFailure).message;
              emit(
                  ProfileError(message: exception),
              );
              },
            (right) {
              if (right.branches != null) {
                emit(
                  ProfileSuccess(allBranchs: right),
                );
              }
        },
      );
    },
    );
  }

  final ProfileRepository profileRepository;
}
