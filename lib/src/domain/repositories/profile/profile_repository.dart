

import 'package:sample_bloc_mobile/src/core/either_dart/either.dart';
import 'package:sample_bloc_mobile/src/data/models/profile/all_branchs_response.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Either<Failure, AllBranchsResponse>> getAllBranchs();

}