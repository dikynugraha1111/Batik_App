import 'package:batik_app/PopUp.dart';
import 'package:batik_app/view/Detail.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:batik_app/view/Qr_Scanner.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultData = "";

  void alertdialog(String str) {
    if (str.isEmpty) {
      return;
    }
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
          height: 200.0, child: new Column(children: [new Text(str)])),
      actions: [
        // new RaisedButton(
        //     color: Colors.blue,
        //     child: new Text("Submit"),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     }),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text("OK",
                style: new TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600))),
      ],
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

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
                  _openCam(context);
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

  Future _openCam(BuildContext context) async {
    final result = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return QrScanner();
    }));
    resultData = result;
    print("Ini DATA Function" + resultData);
    setState(() {
      print("Ini di Widget" + resultData);
      resultData == "KOSONG"
          ? showDialog(
              context: context,
              builder: (context) =>
                  CustomDialog(title: "GAGAL", description: resultData))
          : Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
              return Detail(
                data: resultData,
              );
            }));
    });
  }
}
