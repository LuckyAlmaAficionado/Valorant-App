import 'package:get/get.dart';

import '../modules/agent/bindings/agent_binding.dart';
import '../modules/agent/views/agent_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_agent/bindings/detail_agent_binding.dart';
import '../modules/detail_agent/views/detail_agent_view.dart';
import '../modules/detail_maps/bindings/detail_maps_binding.dart';
import '../modules/detail_maps/views/detail_maps_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/maps/bindings/maps_binding.dart';
import '../modules/maps/views/maps_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.AGENT,
      page: () => const AgentView(),
      binding: AgentBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AGENT,
      page: () => const DetailAgentView(),
      binding: DetailAgentBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => const MapsView(),
      binding: MapsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MAPS,
      page: () => const DetailMapsView(),
      binding: DetailMapsBinding(),
    ),
  ];
}
