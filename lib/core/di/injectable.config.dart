// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/core/api/api.dart' as _i4;
import 'package:app/core/route/route.dart' as _i3;
import 'package:app/features/data/datasources/chat_s.dart' as _i6;
import 'package:app/features/data/datasources/chat_service.dart' as _i5;
import 'package:app/features/data/repositories/chat_impl.dart' as _i8;
import 'package:app/features/domain/repository/chat_r.dart' as _i7;
import 'package:app/features/domain/usecase/chat_u.dart' as _i9;
import 'package:app/features/presentation/cubit/image_gen_cubit.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.$AppRouter>(() => _i3.$AppRouter());
    gh.lazySingleton<_i4.Api>(() => _i4.Api());
    gh.factory<_i5.ChatService>(
      () => _i6.ChatSource(api: gh<_i4.Api>()),
      instanceName: 'chatsource',
    );
    gh.factory<_i7.ChatRepository>(
      () => _i8.ChatImpl(gh<_i5.ChatService>(instanceName: 'chatsource')),
      instanceName: 'ChatRepository',
    );
    gh.factory<_i9.GenerateImageUsecase>(() => _i9.GenerateImageUsecase(
        gh<_i7.ChatRepository>(instanceName: 'ChatRepository')));
    gh.lazySingleton<_i10.ImageGenCubit>(
        () => _i10.ImageGenCubit(gh<_i9.GenerateImageUsecase>()));
    return this;
  }
}
