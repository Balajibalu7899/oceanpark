import 'package:get_it/get_it.dart';
import 'package:ocean_park/services/auth_service.dart';
import 'package:ocean_park/services/custome_service.dart';

final locator = GetIt.instance;

void startUp() {
  locator.registerLazySingleton(() => AuthService.instance());
  locator.registerLazySingleton(() => CustomerService());
}
