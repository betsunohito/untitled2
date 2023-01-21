// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/models/vehicle.dart';

class OtoGaleriView extends StatefulWidget {
  const OtoGaleriView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _OtoGaleriViewState();
  }
}

class _OtoGaleriViewState extends State {
  _OtoGaleriViewState();
  var f = NumberFormat.currency(locale: 'tr', decimalDigits: 0);
  List<Vehicles> vehicles = [
    Vehicles.withId(
        1, "Alfa-Romeo Guilietta 1.6 JTd", 375000, "assets/images/car1.png"),
    Vehicles.withId(2, "BMW 3 Serisi 316i", 279500, "assets/images/car2.png"),
    Vehicles.withId(3, "Mercedes - Benz C Serisi C 180 AMG", 1258000,
        "assets/images/car3.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Galeri"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ListView.builder(
        itemExtent: 110,
        itemCount: vehicles.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0,color: Colors.blue,),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    Image.asset(vehicles[index].Picture).image,
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 14,
                      child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("${vehicles[index].Title}",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: const [
                                Text(
                                  "Adres",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${f.format(vehicles[index].Price)}")
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
