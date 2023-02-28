import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiService {
  @lazySingleton
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'].toString(),
      queryParameters: {
        'key': dotenv.env['WEATHER_API_KEY'].toString(),
      },
    ),
  );
}
