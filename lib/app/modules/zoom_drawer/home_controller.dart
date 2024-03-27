import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../data/models/wilaya.dart';
import '../../data/remote/api_call_status.dart';
import '../../data/remote/base_client.dart';

class HomeController extends GetxController {
  // hold data coming from api
  List<dynamic>? data;
  var selectedIndex = 0.obs;
  var dropdownValue = ''.obs;
  var wilayaList = <Wilaya>[].obs;

  @override
  void onInit() {
  super.onInit();
  loadWilayaData().then((data) {
  wilayaList.value = data;
  if (data.isNotEmpty) {
  dropdownValue.value = data[0].name;
  }
  });
  }

  Future<List<Wilaya>> loadWilayaData() async {
    String jsonString = await rootBundle.loadString('assets/json/Wilaya_Of_Algeria.json');
    print('JSON String: $jsonString'); // Print the JSON string
    List<dynamic> jsonResponse = json.decode(jsonString);
    List<Wilaya> wilayaData = jsonResponse.map((item) => Wilaya.fromJson(item)).toList();
    print('Wilaya Data: $wilayaData'); // Print the list of Wilaya objects
    return wilayaData;
  }
  final drawerController = AdvancedDrawerController();
  void toggle() {
    if (drawerController.value.visible) {
      drawerController.hideDrawer();
    } else {
      drawerController.showDrawer();
    }
  }
  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api
  getData() async {
    // *) perform api call
    await BaseClient.safeApiCall(
      Constants.todosApiUrl, // url
      RequestType.get, // request type (get,post,delete,put)
      onLoading: () {
        // *) indicate loading state
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully
        data = List.from(response.data);
        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);
        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }


}
