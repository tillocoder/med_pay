import 'package:dio/dio.dart';
import 'package:sample_bloc_mobile/src/domain/network/failure.dart';
import 'package:sample_bloc_mobile/src/domain/network/server_error.dart';


// abstract class BaseRepository {
//   BaseFailure getErrorMessage(DioException error) {
//     final serverError = ServerError.withDioError(error: error);
//     return BaseFailure(
//       serverError.message,
//       errorType: error.type,
//       code: serverError.errorCode,
//     );
//   }
//   bool checkIsCancelled(ServerError? value) => (value?.message ?? '') != 'Canceled';
// }