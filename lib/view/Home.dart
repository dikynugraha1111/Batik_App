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
        centerTitle: true,
        title: new Text(
          "Batik Apip",
          style: new TextStyle(
              fontFamily: "DancingScript",
              fontWeight: FontWeight.w600,
              fontSize: 23.0,
              letterSpacing: 1.5),
        ),
        leading: Icon(Icons.ac_unit),
      ),
      body: new SafeArea(
        child: new Stack(children: [
          Container(
            width: double.infinity,
            height: 350.0,
            alignment: Alignment.topCenter,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.vertical(
                    bottom: Radius.elliptical(175.0, 45.0)),
                image: new DecorationImage(
                  image: AssetImage("img/coverHome.jpg"),
                  fit: BoxFit.cover,
                )),
            // child: ClipRRect(
            //     borderRadius:
            //         BorderRadius.only(bottomLeft: Radius.circular(15.0)),
            //     child: new Image.asset(
            //       "img/coverHome.jpg",
            //       fit: BoxFit.cover,
            //     )
            // ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 300.0),
            child: new Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11.0)),
                  child: new Icon(
                    Icons.qr_code_2,
                    color: Colors.black,
                    size: 135.0,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 11.0),
                  child: new Text(
                    "Klik SCAN untuk memulai scanning QR Code",
                    style: new TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                          fontWeight: FontWeight.w700,
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

    print("Ini di Widget" + resultData);
    resultData == "sukses"
        ? Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
            return Detail(
              data: resultData,
            );
          }))
        : showDialog(
            context: context,
            builder: (context) => CustomDialog(
                title: "GAGAL", description: "Maaf, data tidak ditemukan..."));
  }
}
