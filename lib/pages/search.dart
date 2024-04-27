import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guzogo/GetX/controller/controller.dart';

import '../GetX/controller/controller2.dart';
import 'homepage/searching.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final AirportControllerTo airportControllerto =
      Get.put(AirportControllerTo());

  final AirportControllerFrom airportControllerfrom =
      Get.put(AirportControllerFrom());
  final PassengerController controller = Get.find();

  bool ways = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFF211E60),
            height: 380.h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 130.w, right: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 130.h,
                        width: 130.w,
                      ),
                      Container(
                        width: 45.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 45.h,
                  width: 450.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 190.w,
                          height: 35.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ways ? Colors.transparent : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                ways = false;
                              });
                            },
                            child: Text(
                              'Return',
                              style: TextStyle(
                                color: ways
                                    ? Colors.white
                                    : const Color(0xFF211E60),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 190.w,
                          height: 35.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ways ? Colors.white : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                ways = true;
                              });
                            },
                            child: Text(
                              'On-Way',
                              style: TextStyle(
                                color: ways
                                    ? const Color(0xFF211E60)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("From", style: TextStyle(color: Colors.white)),
                    Text("To", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(height: 5.sp),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        bool direction = true;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AirportListPage(
                                    direction: direction,
                                  )),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 30),
                        height: 100.h,
                        width: 190.w,
                        child: Obx(
                          () => RichText(
                            text: TextSpan(
                              children: [
                                if (airportControllerfrom
                                    .selectedAirportCode.value.isNotEmpty)
                                  TextSpan(
                                    text:
                                        '    ${airportControllerfrom.selectedAirportCode.string}\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                    ),
                                  )
                                else
                                  TextSpan(
                                    text: 'ADD\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                if (airportControllerfrom
                                    .selectedAirportCountry.value.isNotEmpty)
                                  TextSpan(
                                    text:
                                        '${airportControllerfrom.selectedAirportCountry.string}\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  )
                                else
                                  TextSpan(
                                    text: 'Addis Abeba\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                if (airportControllerfrom
                                    .selectedAirportName.value.isNotEmpty)
                                  TextSpan(
                                    text:
                                        '${airportControllerfrom.selectedAirportName.string}\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  )
                                else
                                  TextSpan(
                                    text: 'Bole International Airport\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.compare_arrows_rounded,
                        color: Color(0xFF211E60),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          bool direction = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AirportListPage(
                                      direction: direction,
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20.w),
                          height: 100.h,
                          width: 175.w,
                          child: Obx(
                            () => RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '    ${airportControllerto.selectedAirportCode.string}\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  if (airportControllerto
                                      .selectedAirportCountry.value.isNotEmpty)
                                    TextSpan(
                                      text:
                                          '${airportControllerto.selectedAirportCountry.string}\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  else
                                    TextSpan(
                                      text: '  Select Destination\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  TextSpan(
                                    text:
                                        '${airportControllerto.selectedAirportName.string}\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Table(
                border: TableBorder.all(color: Colors.grey),
                children: [
                  // First row
                  TableRow(
                    children: [
                      // First column
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.only(left: 15.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Departure Date",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17.sp),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "25",
                                    style: TextStyle(
                                        color: const Color(0xFF211E60),
                                        fontSize: 52.sp),
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Apr',
                                        style: TextStyle(fontSize: 20.sp),
                                      ),
                                      const Text(
                                        "Tuesday",
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      // Second column
                      TableCell(
                        child: ways
                            ? Container()
                            : Container(
                                padding: EdgeInsets.only(left: 15.w, top: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Return Date",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 17.sp),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "10",
                                          style: TextStyle(
                                              color: const Color(0xFF211E60),
                                              fontSize: 52.sp),
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'May',
                                              style: TextStyle(fontSize: 20.sp),
                                            ),
                                            const Text(
                                              "Wednesday",
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15.w, top: 10.h, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cabin Class",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17.sp),
                              ),
                              Text(
                                "Economy",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Second column
                      TableCell(
                          child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                height: 200.h,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Passengers ",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: const Color(0xFF211E60)),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color:
                                                        const Color(0xFF211E60),
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                " Done",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color:
                                                        const Color(0xFF211E60),
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    _buildCounter('Adult', controller),
                                    _buildCounter('Child', controller),
                                    _buildCounter('Infant', controller),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15.w, top: 10.h, bottom: 10.h),
                          // Conditionally set the background color based on the pressed state
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passengers",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 17.sp),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.man),
                                      Obx(() => Text(
                                            '${controller.adultCount.value}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                  SizedBox(width: 15.w),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.man,
                                        size: 16.sp,
                                      ),
                                      Obx(() => Text(
                                            '${controller.childCount.value}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                  SizedBox(width: 15.w),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.child_care_rounded,
                                        size: 16.sp,
                                      ),
                                      SizedBox(width: 3.w),
                                      Obx(() => Text(
                                            '${controller.infantCount.value}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 140.h),
              Container(
                height: 50.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: const Color(0xfff1c933),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Search Flights",
                    style: TextStyle(
                        color: const Color(0xFF211E60),
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

Widget _buildCounter(String label, PassengerController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
      Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              size: 18.sp,
            ),
            onPressed: () {
              controller.decrementCount(label);
            },
          ),
          Obx(() => Text('${_getCount(label, controller)}')),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 18.sp,
            ),
            onPressed: () {
              controller.incrementCount(label);
            },
          ),
        ],
      ),
    ],
  );
}

int _getCount(String label, PassengerController controller) {
  switch (label) {
    case 'Adult':
      return controller.adultCount.value;
    case 'Child':
      return controller.childCount.value;
    case 'Infant':
      return controller.infantCount.value;
    default:
      return 0;
  }
}
