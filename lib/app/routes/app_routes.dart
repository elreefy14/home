    import 'package:get/get.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import 'routes.dart';
import '../modules/zoom_drawer/zoom_drawer_binding.dart';
import '../modules/zoom_drawer/zoom_drawer_view.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  
    GetPage(
      name: Routes.ZOOM_DRAWER,
      page: () => const ZoomDrawerView(),
      binding: ZoomDrawerBinding(),
    ),
   ];
}
