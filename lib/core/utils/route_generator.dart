import 'package:get/get.dart';
import '../constants/route_constants.dart';
import '../../screens/view/home_screen.dart';
import '../../screens/view/take_permission_page.dart';

class RouteGenerator {
  List<GetPage> getAllRoutes = [
    //GetPage(name: RouteConstants.homescreen, page: ()=>HomeScreen()),
    GetPage(
        name: RouteConstants.takepermissionpage,
        page: () => TakePermissionPage()),
  ];
}
