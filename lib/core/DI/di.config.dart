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
import '../../features/history_list/Cubit/history_list_cubit.dart' as _i900;
import '../../features/history_list/data/history_list_repository.dart' as _i616;
import '../../features/home%20screen/explore%20tab/data/api/api_manager.dart'
    as _i285;
import '../../features/home%20screen/explore%20tab/data/data%20sources/explore_remote_data_source.dart'
    as _i1060;
import '../../features/home%20screen/explore%20tab/data/repository/explore_repository_impl.dart'
    as _i958;
import '../../features/home%20screen/explore%20tab/domain/repository/explore_repository.dart'
    as _i917;
import '../../features/home%20screen/explore%20tab/domain/usecase/get_movies_by_genre_use_case.dart'
    as _i367;
import '../../features/home%20screen/explore%20tab/presentation/manager/explore_cubit.dart'
    as _i628;
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
import '../../features/home%20screen/search%20tab/data/Api/search_api.dart'
    as _i89;
import '../../features/home%20screen/search%20tab/data/data_source/search_dao.dart'
    as _i165;
import '../../features/home%20screen/search%20tab/data/data_source_impl/Search_api_impl.dart'
    as _i510;
import '../../features/home%20screen/search%20tab/data/repository_Impl/search_repo_impl.dart'
    as _i223;
import '../../features/home%20screen/search%20tab/domain/repository/search_repo.dart'
    as _i221;
import '../../features/home%20screen/search%20tab/domain/use_case/search_use_case.dart'
    as _i1008;
import '../../features/home%20screen/search%20tab/presentation/view_model/search_view_model.dart'
    as _i215;
import '../../features/movie%20details/data/repositories/movie_details_repo_impl.dart'
    as _i257;
import '../../features/movie%20details/domain/repositories/movie_details_repo.dart'
    as _i725;
import '../../features/movie%20details/domain/use%20case/get_similar_movies_use_case.dart'
    as _i161;
import '../../features/movie%20details/presentation/manager/movie_details_view_model.dart'
    as _i958;
import '../../features/watch_list/Cubit/watch_list_cubit.dart' as _i344;
import '../../features/watch_list/data/watch_list_repository.dart' as _i86;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioImpl = _$DioImpl();
    gh.factory<_i361.Dio>(() => dioImpl.DioImplement());
    gh.singleton<_i285.ApiManager>(() => _i285.ApiManager());
    gh.lazySingleton<_i603.ForgetPasswordRemoteDataSource>(
      () => _i1050.ForgetPasswordRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i11.SignUpRemoteDataSource>(
      () => _i981.SignUpRemoteDataSourceImpl(),
    );
    gh.singleton<_i25.MovieAvailable>(
      () => _i25.MovieAvailable(gh<_i361.Dio>()),
    );
    gh.singleton<_i89.SearchApi>(() => _i89.SearchApi(gh<_i361.Dio>()));
    gh.factory<_i344.MovieDao>(
      () => _i392.MovieDaoImpl(gh<_i25.MovieAvailable>()),
    );
    gh.factory<_i165.SearchDao>(
      () => _i510.SearchApiImpl(gh<_i89.SearchApi>()),
    );
    gh.factory<_i616.HistoryRepository>(
      () => _i616.HistoryRepository(gh<_i11.SignUpRemoteDataSource>()),
    );
    gh.lazySingleton<_i312.SignUpRepo>(
      () => _i911.SignUpRepoImpl(
        remoteDataSource: gh<_i11.SignUpRemoteDataSource>(),
      ),
    );
    gh.factory<_i725.MovieDetailsRepo>(
      () => _i257.MovieDetailsRepoImpl(gh<_i344.MovieDao>()),
    );
    gh.lazySingleton<_i86.WatchListRepository>(
      () => _i86.WatchListRepository(gh<_i11.SignUpRemoteDataSource>()),
    );
    gh.factory<_i161.GetSimilarMoviesUseCase>(
      () => _i161.GetSimilarMoviesUseCase(gh<_i725.MovieDetailsRepo>()),
    );
    gh.factory<_i1013.MovieRepo>(
      () => _i481.MovieRepoImpl(gh<_i344.MovieDao>()),
    );
    gh.lazySingleton<_i913.ForgetPasswordRepo>(
      () => _i495.ForgetPasswordRepoImpl(
        remoteDataSource: gh<_i603.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i1063.ForgetPasswordUseCase>(
      () => _i1063.ForgetPasswordUseCase(gh<_i913.ForgetPasswordRepo>()),
    );
    gh.factory<_i1060.ExploreRemoteDataSource>(
      () => _i1060.ExploreRemoteDataSourceImpl(gh<_i25.MovieAvailable>()),
    );
    gh.factory<_i221.SearchRepo>(
      () => _i223.SearchRepoImpl(gh<_i165.SearchDao>()),
    );
    gh.factory<_i900.HistoryCubit>(
      () => _i900.HistoryCubit(gh<_i616.HistoryRepository>()),
    );
    gh.factory<_i344.WatchListCubit>(
      () => _i344.WatchListCubit(gh<_i86.WatchListRepository>()),
    );
    gh.factory<_i958.MovieDetailsViewModel>(
      () => _i958.MovieDetailsViewModel(gh<_i161.GetSimilarMoviesUseCase>()),
    );
    gh.factory<_i564.SignUpUseCase>(
      () => _i564.SignUpUseCase(gh<_i312.SignUpRepo>()),
    );
    gh.factory<_i564.GoogleSignInUseCase>(
      () => _i564.GoogleSignInUseCase(gh<_i312.SignUpRepo>()),
    );
    gh.factory<_i349.ForgetPasswordCubit>(
      () => _i349.ForgetPasswordCubit(gh<_i1063.ForgetPasswordUseCase>()),
    );
    gh.factory<_i983.MovieAvailableUseCase>(
      () => _i983.MovieAvailableUseCase(gh<_i1013.MovieRepo>()),
    );
    gh.factory<_i968.SectionUseCase>(
      () => _i968.SectionUseCase(gh<_i1013.MovieRepo>()),
    );
    gh.factory<_i901.SignupCubit>(
      () => _i901.SignupCubit(
        gh<_i564.SignUpUseCase>(),
        gh<_i564.GoogleSignInUseCase>(),
      ),
    );
    gh.factory<_i917.ExploreRepository>(
      () => _i958.ExploreRepositoryImpl(gh<_i1060.ExploreRemoteDataSource>()),
    );
    gh.singleton<_i1008.SearchUseCase>(
      () => _i1008.SearchUseCase(gh<_i221.SearchRepo>()),
    );
    gh.factory<_i367.GetMoviesByGenreUseCase>(
      () => _i367.GetMoviesByGenreUseCase(gh<_i917.ExploreRepository>()),
    );
    gh.factory<_i589.MovieViewModel>(
      () => _i589.MovieViewModel(gh<_i983.MovieAvailableUseCase>()),
    );
    gh.factory<_i33.SectionViewModel>(
      () => _i33.SectionViewModel(gh<_i968.SectionUseCase>()),
    );
    gh.factory<_i215.SearchViewModel>(
      () => _i215.SearchViewModel(gh<_i1008.SearchUseCase>()),
    );
    gh.factory<_i628.ExploreCubit>(
      () => _i628.ExploreCubit(gh<_i367.GetMoviesByGenreUseCase>()),
    );
    return this;
  }
}

class _$DioImpl extends _i465.DioImpl {}
