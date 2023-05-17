import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:if_static_tech/screens/controller/home_screen_controller.dart';
import 'package:if_static_tech/screens/view/home_screen.dart';
import 'package:if_static_tech/screens/view/tab_controller.dart';
import '../controller/location_controller.dart';
import '../controller/home_screen_controller.dart';
import '../../core/utils/text_style.dart';
import '../../core/utils/color.dart';

class TakePermissionPage extends StatelessWidget {
  TakePermissionPage({super.key});
  final locationController = Get.find<LocationController>();
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 30.h),
            Text("What's your location", style: size26_M_bold()),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'We need your location to show available restaurants & products',
              style: size18_M_medium(lightGrey),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () async {
                  Position position = await locationController
                      .determinePosition()
                      .then((value) =>
                          locationController.currentUserPosition = value);

                  //Get.offAll(() => TabControllers(position));
                  Get.offAll(() => HomeScreen(position));
                },
                child: Text(
                  'Allow location access',
                  style: size18_M_medium(Colors.white),
                )),
            SizedBox(height: 40.h),
          ]),
        ),
      ),
    );
  }
}
