import 'package:dio/dio.dart';
import 'package:smart_folder_mobile_app/constants/api_constants.dart';
import 'package:smart_folder_mobile_app/core/apis/custom_dio_exception.dart';

class ApiCalls {
  postData({
    required  String endpoint, required Map<String, dynamic> data})
    async{
      try{
        final Dio dio = Dio();
        BaseOptions(baseUrl: ApiConstants.baseUrl,
        );
        final response = await dio.post(
          endpoint,
          data: data,
        );
        return response.data;
      }
      on DioException catch (e) {
      throw CustomDioException.fromDioError(e);
      } catch (e) {
        throw Exception("An unexpected error occurred: $e");
    }
    }

}