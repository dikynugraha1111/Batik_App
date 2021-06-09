import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  // const QrScanner({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  bool _flashOn = false;
  bool _frontCam = false;
  late String result;
  late QRViewController _controller;

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
            onQRViewCreated: (QRViewController controller) {
              this._controller = controller;
              controller.scannedDataStream.listen((event) {
                if (mounted) {
                  //dispose controller
                  // _controller.dispose();

                  result = event.code;
                  Navigator.pop(context, result);
                }
              });
            },
          ),
          new Padding(
            padding: EdgeInsets.only(top: 75.0),
            child: new Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                new Text(
                  "Batik Scanner",
                  style: new TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5),
                ),
                new Text(
                  "Sejajarkan Qr Code batik dengan Scanner",
                  style: new TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2.0,
                  ),
                )
              ]),
            ),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      _controller.toggleFlash();
                      setState(() {
                        _flashOn = !_flashOn;
                      });
                    },
                    icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off),
                    color: Colors.white),
                IconButton(
                    onPressed: () {
                      _controller.flipCamera();
                      setState(() {
                        _frontCam = !_frontCam;
                      });
                    },
                    icon: Icon(
                        _frontCam ? Icons.camera_front : Icons.camera_rear),
                    color: Colors.white),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, "gagal");
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
