import 'package:ecommerce_app/core/di/service_locatop.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await serviceLocator.init();
