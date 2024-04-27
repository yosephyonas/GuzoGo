import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guzogo/GetX/controller/controller.dart';

import '../../Respository/data/airport.dart';
import '../../Respository/model/airport_model.dart';
import '../../common/searchbar.dart';

class AirportListPage extends StatelessWidget {
  AirportListPage({super.key, required this.direction});
  final bool direction;
  static const String route = '/airportlist';

  final AirportControllerTo airportControllerto =
      Get.put(AirportControllerTo());
  final AirportControllerFrom airportControllerfrom =
      Get.put(AirportControllerFrom());

  @override
  Widget build(BuildContext context) {
    List decodedData = jsonDecode(AirportData.jsonData);

    List<Airport> airports = [];
    for (var item in decodedData[0]) {
      airports.add(Airport.fromJson(item));
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Airport",
                      style: TextStyle(
                          fontSize: 22.sp, color: const Color(0xFF211E60))),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 22.sp, color: const Color(0xFF211E60))),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.h),
            const Searchbar(),
            SizedBox(height: 10.h),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(right: 250.w),
              child: Text(
                "Direct Airports",
                style: TextStyle(
                    fontSize: 17.sp,
                    color: const Color(0xFF211E60),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: airports.length,
                itemBuilder: (context, index) {
                  final airport = airports[index];
                  return ListTile(
                    onTap: () {
                      if (direction) {
                        airportControllerfrom.selectedAirportName(airport.name);
                        airportControllerfrom.selectedAirportCode(airport.code);

                        airportControllerfrom
                            .selectedAirportCountry(airport.country);
                      } else {
                        airportControllerto.selectedAirportName(airport.name);
                        airportControllerto.selectedAirportCode(airport.code);

                        airportControllerto
                            .selectedAirportCountry(airport.country);
                      }

                      Navigator.pop(context);
                    },
                    leading: Icon(
                      Icons.flight,
                      size: 17.sp,
                    ),
                    title: Text(
                      '${airport.name},${airport.country} (${airport.code})',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
