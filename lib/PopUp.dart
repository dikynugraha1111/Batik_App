import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;

  CustomDialog({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 75, bottom: 16, left: 16, right: 16),
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  )
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 28.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(description,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300)),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        primary: Colors.blueAccent,
                        shadowColor: Colors.grey),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('CONFIRM',
                        style: new TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w800,
                            fontSize: 15.0,
                            letterSpacing: 1.0)),
                  ),
                )
              ],
            )),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: Image.asset(
            'img/failed.gif',
            height: 130.0,
          ),
        )
      ],
    );
  }
}
