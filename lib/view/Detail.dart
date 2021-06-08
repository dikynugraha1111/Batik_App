import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:hexcolor/hexcolor.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var img = NetworkImage(
      "aaahttps://blog.mariberkarya.com/wp-content/uploads/2020/02/9-Motif-Batik-Yogyakarta-yang-Wajib-Kamu-Ketahui-Motif-Batik-Nitik-1024x559.jpg");

  TextStyle detailBatik = TextStyle(
      fontSize: 14.0,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  new Container(
                      width: MediaQuery.of(context).size.width,
                      height: 215.0,
                      decoration: new BoxDecoration(
                          color: HexColor("#B3e9c46a"),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25.0),
                              bottomLeft: Radius.circular(25.0))),
                      child: Image.network(
                        "ssshttps://blog.mariberkarya.com/wp-content/uploads/2020/02/9-Motif-Batik-Yogyakarta-yang-Wajib-Kamu-Ketahui-Motif-Batik-Nitik-1024x559.jpg",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          print(exception);
                          return Center(
                            child: Text(
                              'No Image Dude...😢',
                              style: new TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 33.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.0,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        fit: BoxFit.cover,
                        // width: MediaQuery.of(context).size.width,
                        // height: 215.0,
                      )),

                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: HexColor("#264653"),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Judul
                  // Center(
                  //   child: Container(
                  //     decoration: new BoxDecoration(
                  //         borderRadius: BorderRadius.circular(11),
                  //         color: Colors.white),
                  //     padding: EdgeInsets.symmetric(horizontal: 11.0),
                  //     margin: EdgeInsets.only(top: 190.0),
                  //     child: Text(
                  //       "Batik Nitik Yogyakarta",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           fontStyle: FontStyle.normal,
                  //           fontSize: 27.0,
                  //           letterSpacing: 1.5,
                  //           fontWeight: FontWeight.w600,
                  //           fontFamily: "Poppins"),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 15.0,
                  left: 21.0,
                  right: 21.0,
                ),
                child: new Text(
                  "Batik Nitik Yogyakarta",
                  style: new TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 21.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Icon Detail
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     vertical: 16.0,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       Column(
              //         children: <Widget>[
              //           Icon(Icons.wine_bar),
              //           SizedBox(height: 8.0),
              //           Text("WOW"),
              //         ],
              //       ),
              //       Column(
              //         children: <Widget>[
              //           Icon(Icons.access_time),
              //           SizedBox(height: 8.0),
              //           Text("12 Jam"),
              //         ],
              //       ),
              //       Column(
              //         children: <Widget>[
              //           Icon(Icons.monetization_on),
              //           SizedBox(height: 8.0),
              //           Text("10Jt")
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Desc
              Divider(
                thickness: 1.5,
                height: 11.0,
                indent: 20,
                endIndent: 20,
              ),
              new Container(
                padding: EdgeInsets.only(left: 21.0, right: 21.0, top: 3.0),
                child: Row(
                  children: [
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          "Nama Pembatik ",
                          style: detailBatik,
                        ),
                        new Text("Kelompok Paguyuban", style: detailBatik),
                        new Text("Grade", style: detailBatik),
                      ],
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(": Jokodadi", style: detailBatik),
                        new Text(": Paguyuban Loak Jogja", style: detailBatik),
                        new Text(": A", style: detailBatik),
                      ],
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 5.0, left: 21.0, right: 21.0),
                child: Text(
                  "Description",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 21.0, left: 21.0, bottom: 30.0),
                child: Text(
                  "Wes pokok apik jan tur ngeri. No comment wes... lae lae kerjo kejro.... ngetik ro mikir di gaji nggeh oawkoakokw :D oakwokaowkaokwokaowkaokwoakwokaowkoakwoakwokaowkoakwoakw",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 0.5,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ),
              ),

              Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 11.0, vertical: 3.0),
                  decoration: BoxDecoration(
                    color: HexColor("#e9c46a"),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: new Text(
                    "N.T.DIY.SN.01.2.EX-192038420",
                    style: new TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ),

              // Image List
              // Container(
              //   height: 144.0,
              //   padding: EdgeInsets.only(bottom: 5.0),
              //   child: Scrollbar(
              //     controller: _scrollController,
              //     isAlwaysShown: true,
              //     child: new ListView.builder(
              //       controller: _scrollController,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: widget.place.imageUrls.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 5.0),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(10.0),
              //             child: new Image.network(widget.place.imageUrls[index]),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
