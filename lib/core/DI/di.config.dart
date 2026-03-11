// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/forget_password_screen/data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i603;
import '../../features/auth/forget_password_screen/data/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i1050;
import '../../features/auth/forget_password_screen/data/repositories/forget_password_repo_impl.dart'
    as _i495;
import '../../features/auth/forget_password_screen/domain/repositories/forget_password_repo.dart'
    as _i913;
import '../../features/auth/forget_password_screen/domain/use_case/forget_password_use_case.dart'
    as _i1063;
import '../../features/auth/forget_password_screen/presentation/Cubit/forget_password_cubit.dart'
    as _i349;
import '../../features/auth/sign_up_screen/data/data%20sources/remote/sign_up_remote_data_source.dart'
    as _i11;
import '../../features/auth/sign_up_screen/data/data%20sources/remote/sign_up_remote_data_source_impl.dart'
    as _i981;
import '../../features/auth/sign_up_screen/data/repositories/sign_up_repo_impl.dart'
    as _i911;
import '../../features/auth/sign_up_screen/domain/repositories/sign_up_repo.dart'
    as _i312;
import '../../features/auth/sign_up_screen/domain/use%20case/use_case.dart'
    as _i564;
import '../../features/auth/sign_up_screen/presentation/manager/signup_cubit.dart'
    as _i901;
import '../../features/home%20screen/home%20tab/data/Api/dio_impl.dart'
    as _i465;
import '../../features/home%20screen/home%20tab/data/Api/movie_available.dart'
    as _i25;
import '../../features/home%20screen/home%20tab/data/repository%20impl/movie_repo_impl.dart'
    as _i481;
import '../../features/home%20screen/home%20tab/data/source%20data%20impl/movie_avaliable_api_impl.dart'
    as _i392;
import '../../features/home%20screen/home%20tab/data/source%20data/movie_dao.dart'
    as _i344;
import '../../features/home%20screen/home%20tab/domain/repository/movie_repo.dart'
    as _i1013;
import '../../features/home%20screen/home%20tab/domain/useCases/movie_available_use_case.dart'
    as _i983;
import '../../features/home%20screen/home%20tab/domain/useCases/section_use_case.dart'
    as _i968;
import '../../features/home%20screen/home%20tab/presentation/view%20model/movie_view_model.dart'
    as _i589;
import '../../features/home%20screen/home%20tab/presentation/view%20model/section_view_model.dart'
    as _i33;
import '../../features/home%20screen/home%20tab/presentation/view%20model/movie_view_model.dart'
    as _i589;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioImpl = _$DioImpl();
    gh.factory<_i361.Dio>(() => dioImpl.DioImplement());
    gh.lazySingleton<_i603.ForgetPasswordRemoteDataSource>(
      () => _i1050.ForgetPasswordRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i11.SignUpRemoteDataSource>(
      () => _i981.SignUpRemoteDataSourceImpl(),
    );
    gh.singleton<_i25.MovieAvailable>(
      () => _i25.MovieAvailable(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i312.SignUpRepo>(
      () => _i911.SignUpRepoImpl(
        remoteDataSource: gh<_i11.SignUpRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i913.ForgetPasswordRepo>(
      () => _i495.ForgetPasswordRepoImpl(
        remoteDataSource: gh<_i603.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i344.MovieDao>(
      () => _i392.MovieAvaliableApiImpl(gh<_i25.MovieAvailable>()),
    );
    gh.factory<_i1063.ForgetPasswordUseCase>(
      () => _i1063.ForgetPasswordUseCase(gh<_i913.ForgetPasswordRepo>()),
    );
    gh.factory<_i564.SignUpUseCase>(
      () => _i564.SignUpUseCase(gh<_i312.SignUpRepo>()),
    );
    gh.factory<_i349.ForgetPasswordCubit>(
      () => _i349.ForgetPasswordCubit(gh<_i1063.ForgetPasswordUseCase>()),
    );
    gh.factory<_i901.SignupCubit>(
      () => _i901.SignupCubit(gh<_i564.SignUpUseCase>()),
    );
    gh.factory<_i1013.MovieRepo>(
      () => _i481.MovieRepoImpl(gh<_i344.MovieDao>()),
    );
    gh.factory<_i983.MovieAvailableUseCase>(
      () => _i983.MovieAvailableUseCase(gh<_i1013.MovieRepo>()),
    );
    gh.factory<_i968.SectionUseCase>(
      () => _i968.SectionUseCase(gh<_i1013.MovieRepo>()),
    );
    gh.factory<_i589.MovieViewModel>(
      () => _i589.MovieViewModel(gh<_i983.MovieAvailableUseCase>()),
    );
    gh.factory<_i33.SectionViewModel>(
      () => _i33.SectionViewModel(gh<_i968.SectionUseCase>()),
    );
    gh.factory<_i589.MovieViewModel>(
      () => _i589.MovieViewModel(gh<_i983.MovieAvailableUseCase>()),
    );
    return this;
  }
}

class _$DioImpl extends _i465.DioImpl {}
