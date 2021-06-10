import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class GetBarcode {
  String status;
  String namaPembatik;
  String namaPaguyuban;
  String namaMotif;
  String namaPewarna;
  String urlImg;

  GetBarcode(
      {required this.status,
      required this.namaPembatik,
      required this.namaPaguyuban,
      required this.namaMotif,
      required this.namaPewarna,
      required this.urlImg});
  factory GetBarcode.getData(Map<String, dynamic> object) {
    return GetBarcode(
        status: object["status"],
        namaPembatik: object["data"]["nama_pembatik"],
        namaPaguyuban: object["data"]["paguyuban"],
        namaMotif: object["data"]["motif"],
        namaPewarna: object["data"]["pewarnaan"],
        urlImg: object["data"]["img_url"]);
  }

  static Future<GetBarcode> connectToApi(String codeScan) async {
    var response = await http.get(
        Uri.parse("http://batik.futsaloka.my.id/api/fetchcode/" + codeScan));
    var responseObject = json.decode(response.body);
    return GetBarcode.getData(responseObject);
  }
}
