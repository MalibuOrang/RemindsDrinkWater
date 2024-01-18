import 'package:drink_water_reminded/features/cups_screen/controller/cups_controller.dart';
import 'package:drink_water_reminded/features/drink_water_screen/controller/wether_level_controller.dart';
import 'package:drink_water_reminded/features/home_screen/controllers/home_controller.dart';
import 'package:drink_water_reminded/features/login_screen/controller/sing_google_controller.dart';
import 'package:get_it/get_it.dart';

class LazyInitController {
  void initAllControllers() {
    GetIt.I.registerLazySingleton<CupsController>(() => CupsController());
    GetIt.I.registerLazySingleton<WeatherLevelController>(
        () => WeatherLevelController());
    GetIt.I.registerLazySingleton<HomeController>(() => HomeController());
    GetIt.I.registerLazySingleton<SingInGoogleController>(
        () => SingInGoogleController());
  }
}
