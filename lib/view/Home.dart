import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Batik_App"),
        leading: Icon(Icons.home),
      ),
      body: Container(
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Text(
                "Scanning Barcode",
                style: new TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
              new Icon(
                Icons.qr_code_2_rounded,
                color: Colors.black,
                size: 21.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
