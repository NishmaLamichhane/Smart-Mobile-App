import 'package:smart_folder_mobile_app/core/apis/api_calls.dart';

abstract class AuthDataSources {
  Future<String>registeruser({
    required Map<String, dynamic> userData
  }  );
}
  class AuthDataSourcesImpl extends AuthDataSources {

final ApiCalls apiCalls;

  AuthDataSourcesImpl({required this.apiCalls});

  @override
  Future<String> registeruser({
    required Map<String, dynamic> userData,
  }) async {
  
      final response = await apiCalls.postData(
        endpoint: 'ApiConstants.registerUserRoute',
        data: userData,
      );
      print(response);
      return 'User registered successfully: ${response['message']}';
    } 
  }


