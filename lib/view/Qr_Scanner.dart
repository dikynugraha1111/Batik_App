import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  // const QrScanner({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey();
  bool _flashOn = false;
  bool _frontCam = false;
  late QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
          child: Stack(
        children: [
          new QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
            ),
            onQRViewCreated: (QRViewController controller) {
              this._controller = controller;
            },
          ),
          new Container(color: Colors.blueAccent),
          new Padding(
            padding: EdgeInsets.only(top: 19.0),
            child: new Align(
              alignment: Alignment.topCenter,
              child: new Text(
                "Batik Scanner",
                style: new TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.5),
              ),
            ),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _flashOn = !_flashOn;
                      });
                      _controller.toggleFlash();
                    },
                    icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
                    color: Colors.white),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _frontCam = !_frontCam;
                      });
                      _controller.flipCamera();
                    },
                    icon: Icon(
                        _frontCam ? Icons.camera_front : Icons.camera_rear),
                    color: Colors.white),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
