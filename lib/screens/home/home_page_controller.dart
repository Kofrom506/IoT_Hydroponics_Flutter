import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:flutter_hydroponics/configs/configs.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {

  var data = <Map<String, dynamic>>[].obs;

  var isLoading = true.obs;
  var isLoadingLatest = true.obs;

  var number = 0.obs;
  // var isLoadingImage = true.obs;

  // Weather weatherData = Weather();
  // DataNow dataNow = DataNow(personCount: 0, dateTime: DateTime.now());

  double lat = -6.359897830104273;
  final double lon = 106.82723430001242;
  final String city = "Depok";
  final String country = "Indonesia";

  var uri = "https://api.openweathermap.org/data/2.5/weather?lat=-6.359897830104273&lon=106.82723430001242&appid=2b7f68fc45158a3eecc242be3998ac85&q=Depok&country=Indonesia&mode=json&units=metric";

  void onInit() {
    super.onInit();
    fetchData();
    fetchDataNow();
    print("Evan");
  }

  Future<void> fetchData() async {

    try {
      isLoading(true);
      var snapshot = await FirebaseFirestore.instance.collection('progresses').get();
      data.assignAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());

      print(data);
    } catch (e) {
      print('Error fetching data: $e');
    }
    finally {
      isLoading(false);
    }
  }

  Future<void> fetchDataNow() async {

    try {
      isLoading(true);
      var snapshot = await FirebaseFirestore.instance.collection('data').get();
      data.assignAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());

      print(data);

    } catch (e) {
      print('Error fetching data: $e');
    }
    finally {
      isLoading(false);
    }
  }
}

class DataNow {
  final double? ec;
  final double? ph;

  DataNow({
    this.ec,
    this.ph,
  });
}