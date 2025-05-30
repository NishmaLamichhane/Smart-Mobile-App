import 'package:dartz/dartz.dart';
import 'package:smart_folder_mobile_app/core/apis/api_error.dart';
import 'package:smart_folder_mobile_app/core/apis/custom_dio_exception.dart';
import 'package:smart_folder_mobile_app/features/auth/data/sources/auth_data_sources.dart';

abstract class AuthRepositories {
  Future<Either<ApiError, String>> registerUser({
    required Map<String, dynamic> userData,
  });
}
class AuthRepositoriesImpl extends AuthRepositories{
final AuthDataSources authDataSources;

  AuthRepositoriesImpl({required this.authDataSources});

  @override
  Future<Either<ApiError, String>> registerUser({
    required Map<String, dynamic> userData,
  }) async {
    try {
      final response = await authDataSources.registeruser(userData: userData);
      return Right(response);
    } on CustomDioException catch (e) {
      return Left(ApiError(errorMessage: e.toString()));
    }
  }
}
