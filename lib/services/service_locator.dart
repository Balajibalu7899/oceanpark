import 'package:get_it/get_it.dart';
import '/services/auth_service.dart';
import '/services/custome_service.dart';

final locator = GetIt.instance;

void startUp() {
  locator.registerLazySingleton(() => AuthService.instance());
  locator.registerLazySingleton(() => CustomerService());
  locator.registerLazySingleton(() => CustomerService());
}
