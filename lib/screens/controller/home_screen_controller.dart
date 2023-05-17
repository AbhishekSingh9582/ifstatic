import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/resturant.dart';

class HomeScreenController extends GetxController {
  List<Resturant> _listResturant = [];

  List<Resturant> get listResturant {
    return [..._listResturant];
  }

  String baseUrl = 'https://theoptimiz.com/restro/public/api/';

  Future<List<Resturant>> postdata(String lat, String lng) async {
    try {
      var response = await http.post(Uri.parse('${baseUrl}get_resturants'),
          body: {"lat": lat, "lng": lng});
      Map<String, dynamic> result =
          json.decode(response.body) as Map<String, dynamic>;
      if (result["status"] == "SUCCESS") {
        List<Resturant> tempList = [];
        for (int i = 0; i < result['data'].length; i++) {
          tempList.add(Resturant.fromJson(result['data'][i]));
        }
        _listResturant = tempList;

        return tempList;
      } else {
        print('Not Succes');
        return listResturant;
      }
    } catch (error) {
      print('$error at line 34 home_screen controller');
      return [];
    }
  }
}
