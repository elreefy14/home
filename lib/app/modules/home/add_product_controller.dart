import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/house_model.dart';

import '../../data/models/commune_of_algeria.dart';
import '../../data/models/wilaya.dart';
import '../../data/remote/api_call_status.dart';

class AddProductController extends GetxController {
  // hold data coming from api
  List<Map<dynamic, dynamic>> data = [];
  var isSwitched = false.obs;
  var dropdownValue1 = 'One'.obs;
  var dropdownValue2 = 'One'.obs;
  var wilayaDropDown = 'One'.obs;
  var dropdownValue4 = 'One'.obs;

  var wilayaList = <Wilaya>[].obs;
  //arabic names of wilaya
  List<String> arNamesOfWilaya = [];
  //list of arabic names of communes
  List<String> arCommunes = [];

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.success;

  Future<List<String>> loadWilayaArNames() async {
    String jsonString =
        await rootBundle.loadString('assets/json/Wilaya_Of_Algeria.json');
    // print('JSON String: $jsonString'); // Print the JSON string
    List<dynamic> jsonResponse = json.decode(jsonString);
    List<Wilaya> wilayaData =
        jsonResponse.map((item) => Wilaya.fromJson(item)).toList();
//  print('Wilaya Data: $wilayaData'); // Print the list of Wilaya objects

    List<String> arNames = wilayaData.map((wilaya) => wilaya.arName).toList();
    //  print('Arabic Names: $arNames'); // Print the list of Arabic names

    return arNames;
  }

  Future<List<String>> loadCommuneArNames(String wilayaId) async {
    String jsonString =
        await rootBundle.loadString('assets/json/Commune_Of_Algeria.json');
    print('JSON String: $jsonString'); // Print the JSON string
    List<dynamic> jsonResponse = json.decode(jsonString);
    List<Commune> communeData =
        jsonResponse.map((item) => Commune.fromJson(item)).toList();
    print('Commune Data: $communeData'); // Print the list of Commune objects

    List<String> arNames = communeData
        .where((commune) => commune.wilayaId == wilayaId)
        .map((commune) => commune.arName)
        .toList();
    arCommunes = arNames;
    if (data.isNotEmpty) {
      dropdownValue4.value = arNames[0];
    }
    //emit state
    update();
    print('Arabic Names: $arNames'); // Print the list of Arabic names

    return arNames;
  }

  void toggle() {
    isSwitched.value = !isSwitched.value;
  }

  @override
  void onInit() {
    super.onInit();

    loadWilayaArNames().then((data) {
      arNamesOfWilaya = data;
      if (data.isNotEmpty) {
        wilayaDropDown.value = data[0];
      }
      loadCommuneArNames('9').then((data) {
        arCommunes = data;
        if (data.isNotEmpty) {
          dropdownValue4.value = data[0];
        }
        //first item of dropdownValue1 'ايجار
        dropdownValue1.value = 'ايجار';
        //first item of dropdownValue2 'شقة'
        dropdownValue2.value = 'مبنى';
      });
    });
  }

  void goToDetails(HouseModel house) {
    Get.toNamed('/details', arguments: house);
  }
}
