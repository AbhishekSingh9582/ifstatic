import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:if_static_tech/core/utils/color.dart';
import 'package:if_static_tech/core/utils/text_style.dart';
import 'package:if_static_tech/screens/model/resturant.dart';

import '../controller/home_screen_controller.dart';
import '../controller/location_controller.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  Position position;
  HomeScreen(this.position, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();
  LocationController locationController = Get.find<LocationController>();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    Get.put(LocationController());
    Get.put(HomeScreenController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: [
                  appbarStories(),
                  AllResturants(widget.position),
                ],
              ),
      ),
    );
  }

  appbarStories() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [lightPink, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Alpha Noida',
                  style: size18_M_bold(Colors.black),
                )),
            Text(
              'Stories',
              style: size18_M_medium(Colors.black),
            ),
            SizedBox(height: 10.h),
            Container(
              // color: Colors.orange,
              height: 128.h,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  4,
                  (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 128.h,
                      width: 97.h,
                      margin: const EdgeInsets.only(right: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/Images/foodimage.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      );
}

// class AllResturants extends StatefulWidget {
//   Position position;
//   AllResturants(this.position, {super.key});

//   @override
//   State<AllResturants> createState() => _AllResturantsState();
// }

// class _AllResturantsState extends State<AllResturants> {
//   TextEditingController searchController = TextEditingController();
//   HomeScreenController homeScreenController = Get.find<HomeScreenController>();
//   List<Resturant> resturantLst = [];
//   List<Resturant> filterResturant = [];
//   bool isLoading = true;
//   String searchFieldRest = '';
//   @override
//   void initState() {
//     print('print ${widget.position.latitude}  ${widget.position.altitude}');
//     homeScreenController = Get.find<HomeScreenController>();
//     loadResturantsData();
//     super.initState();
//   }

//   Future<void> loadResturantsData() async {
//     // setState(() {
//     //   isLoading = true;
//     // });
//     final responseData = await homeScreenController.postdata(
//         widget.position.latitude.toString(),
//         widget.position.longitude.toString());
//     print('response data ${responseData.length}');
//     setState(() {
//       resturantLst = List<Resturant>.from(responseData);
//       print('inside setState ${resturantLst.length}');
//       isLoading = false;
//     });
//   }

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   resturantLst = homeScreenController.listResturant;
//   // }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     searchController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print('list length = ${widget.resturantLst.length}');
//     return isLoading
//         ? Center(child: CircularProgressIndicator())
//         : Column(
//             children: [
//               TextField(
//                 //controller: searchController,
//                 onChanged: (value) async {
//                   setState(() {
//                     filterResturant = resturantLst
//                         .where((element) => element.name!.contains(value))
//                         .toList();
//                     searchFieldRest = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                     hintText: 'Search Food Item',
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25)),
//                     prefixIcon: Icon(Icons.search)),
//               ),
//               if (searchFieldRest != '')
//                 ...List.generate(
//                     filterResturant.length,
//                     (index) => ListTile(
//                           title: Text(
//                             resturantLst[index].name!,
//                             style: TextStyle(color: Colors.black),
//                           ),
//                           subtitle: Text(resturantLst[index].rating!),
//                           trailing: IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () {
//                               //controller.removeItem(index);
//                             },
//                           ),
//                         )),
//               if (searchFieldRest == '')
//                 ...List.generate(
//                     resturantLst.length,
//                     (index) => ListTile(
//                           title: Text(
//                             resturantLst[index].name!,
//                             style: TextStyle(color: Colors.black),
//                           ),
//                           subtitle: Text(resturantLst[index].rating!),
//                           trailing: IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () {
//                               //controller.removeItem(index);
//                             },
//                           ),
//                         )),
//               // Container(
//               //   height: 400,
//               //   width: MediaQuery.of(context).size.width,
//               //   child: FutureBuilder(
//               //     future: homeScreenController.postdata(
//               //         widget.position.latitude.toString(),
//               //         widget.position.longitude.toString()),
//               //     builder: (context, snapshot) {
//               //       if (snapshot.connectionState == ConnectionState.waiting) {
//               //         print('print circular progress');
//               //         return const Center(
//               //           child: CircularProgressIndicator(),
//               //         );
//               //       } else if (snapshot.hasData) {
//               //         List<Resturant> resturantLst = snapshot.data as List<Resturant>;

//               //         return ListView.builder(
//               //           itemCount: resturantLst.length,
//               //           itemBuilder: (context, index) {
//               //             //final item = controller.itemList[index];
//               //             final item = resturantLst[index];
//               //             print('print ${resturantLst.length}');
//               //             return ListTile(
//               //               title: Text(
//               //                 item.name!,
//               //                 style: TextStyle(color: Colors.black),
//               //               ),
//               //               subtitle: Text(item.rating!),
//               //               trailing: IconButton(
//               //                 icon: Icon(Icons.delete),
//               //                 onPressed: () {
//               //                   //controller.removeItem(index);
//               //                 },
//               //               ),
//               //             );
//               //           },
//               //         );
//               //       } else {
//               //         return Container();
//               //       }
//               //     },
//               //   ),
//               // ),
//             ],
//           );
//   }
// }

class AllResturants extends StatefulWidget {
  Position position;
  AllResturants(this.position, {super.key});

  @override
  State<AllResturants> createState() => _AllResturantsState();
}

class _AllResturantsState extends State<AllResturants> {
  TextEditingController searchController = TextEditingController();
  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextFormField(
            controller: searchController,
            onChanged: (value) async {
              setState(() {});
            },
            decoration: InputDecoration(
                hintText: 'Search Food Item',
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon: Icon(Icons.search)),
          ),
          Expanded(
              child: FutureBuilder(
                  future: homeScreenController.postdata(
                      widget.position.latitude.toString(),
                      widget.position.longitude.toString()),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index].name!;

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  ResturantItem(snapshot.data![index]),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ResturantItem(snapshot.data![index]),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class ResturantItem extends StatelessWidget {
  Resturant resturant;
  ResturantItem(this.resturant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.black,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 175.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18)),
                      image: DecorationImage(
                          image: NetworkImage('${resturant.primaryImage}'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: 3,
                    right: 4,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${resturant.rating}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    )),
              ]),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2),
                            Text(
                              '${resturant.name}',
                              style: size16_M_semibold(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                '${resturant.tags}',
                                softWrap: true,
                                style: size10_M_normal(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Text(
                            '${resturant.discount}% FLAT OFF',
                            style: size12_M_semibold(textColor: Colors.red),
                          ))
                    ]),
              ),
            ],
          )),
    );
  }
}
