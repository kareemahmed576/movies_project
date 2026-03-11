// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_project/features/auth/sign_up_screen/data/data%20sources/remote/sign_up_remote_data_source.dart'
    as _i556;
import 'package:movies_project/features/auth/sign_up_screen/data/data%20sources/remote/sign_up_remote_data_source_impl.dart'
    as _i490;
import 'package:movies_project/features/auth/sign_up_screen/data/repositories/sign_up_repo_impl.dart'
    as _i229;
import 'package:movies_project/features/auth/sign_up_screen/domain/repositories/sign_up_repo.dart'
    as _i54;
import 'package:movies_project/features/auth/sign_up_screen/domain/use%20case/use_case.dart'
    as _i577;
import 'package:movies_project/features/auth/sign_up_screen/presentation/manager/signup_cubit.dart'
    as _i424;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i556.SignUpRemoteDataSource>(
      () => _i490.SignUpRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i54.SignUpRepo>(
      () => _i229.SignUpRepoImpl(
        remoteDataSource: gh<_i556.SignUpRemoteDataSource>(),
      ),
    );
    gh.factory<_i577.SignUpUseCase>(
      () => _i577.SignUpUseCase(gh<_i54.SignUpRepo>()),
    );
    gh.factory<_i424.SignupCubit>(
      () => _i424.SignupCubit(gh<_i577.SignUpUseCase>()),
    );
    return this;
  }
}
