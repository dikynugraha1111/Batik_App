import 'package:batik_app/view/Qr_Scanner.dart';
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
      body: new SafeArea(
        child: new Stack(children: [
          Container(
            alignment: Alignment.center,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  "Scanning Barcode",
                  style: new TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 21.0,
                  ),
                ),
                new Icon(
                  Icons.qr_code_2_rounded,
                  color: Colors.black,
                  size: 135.0,
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(bottom: 21.0),
            alignment: Alignment.bottomCenter,
            child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    primary: Colors.blueAccent,
                    shadowColor: Colors.grey),
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return QrScanner();
                  }));
                },
                child: new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.0),
                  child: new Text("SCAN",
                      style: new TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 28.0,
                          color: Colors.white,
                          letterSpacing: 2.0),
                      textAlign: TextAlign.center),
                )),
          )
        ]),
      ),
    );
  }
}
