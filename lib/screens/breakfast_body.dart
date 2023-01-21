import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/models/vehicle.dart';

class BreakFastView extends StatefulWidget {
  const BreakFastView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _BreakFastViewState();
  }
}

class _BreakFastViewState extends State {
  _BreakFastViewState();
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kahvaltı",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.white),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Icon(Icons.qr_code_2_outlined,
                          size: 300, color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                          TextButton(
                                            child: Text('Randevu Kodu Al'),
                                            onPressed: () {
                                              print('Pressed');
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
