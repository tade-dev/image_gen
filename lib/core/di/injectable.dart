import 'package:app/core/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt si = GetIt.instance;

@InjectableInit()
void configureDependencies ()=> si.init();