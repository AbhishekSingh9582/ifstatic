import 'package:flutter/material.dart';
import 'package:if_static_tech/screens/view/take_permission_page.dart';
import './screens/view/get_location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import './core/constants/route_constants.dart';
import './screens/controller/location_controller.dart';
import './screens/controller/home_screen_controller.dart';
import './core/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: AppBinding(),
        initialRoute: RouteConstants.takepermissionpage,
        getPages: RouteGenerator().getAllRoutes,
        //home: TakePermissionPage(),
      ),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    WidgetsFlutterBinding.ensureInitialized();
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}
