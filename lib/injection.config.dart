// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/bloc/weather_bloc.dart' as _i5;
import 'package:weather_app/data/weather_repository.dart' as _i4;

import 'data/api_service.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiService = _$ApiService();
  gh.factory<_i3.Dio>(() => apiService.dio);
  gh.lazySingleton<_i4.WeatherRepository>(
      () => _i4.WeatherRepository(gh<_i3.Dio>()));
  gh.factory<_i5.WeatherBloc>(
      () => _i5.WeatherBloc(weatherRepository: gh<_i4.WeatherRepository>()));
  return getIt;
}

class _$ApiService extends _i6.ApiService {}
