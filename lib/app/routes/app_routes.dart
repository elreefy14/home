import 'package:get/get.dart';
import '../modules/home/add_product_binding.dart';
import '../modules/home/add_product_view.dart';
import 'routes.dart';
import '../modules/zoom_drawer/home_binding.dart';
import '../modules/zoom_drawer/home_view.dart';
import 'routes.dart';
import '../modules/details/details_binding.dart';
import '../modules/details/details_view.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ZOOM_DRAWER,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsView(Get.arguments),
      binding: DetailsBinding(),
    ),
  ];
}
