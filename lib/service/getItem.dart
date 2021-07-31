import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class GetItem {
  String status;
  String namaPembatik;
  String namaPaguyuban;
  String namaMotif;
  String namaPewarna;
  String grade;
  String desc;
  String urlImg;
  String filosofi;

  GetItem({
    required this.status,
    required this.namaPembatik,
    required this.namaPaguyuban,
    required this.namaMotif,
    required this.namaPewarna,
    required this.grade,
    required this.desc,
    required this.urlImg,
    required this.filosofi,
  });
  factory GetItem.getData(Map<String, dynamic> object) {
    return GetItem(
        status: object["status"],
        namaPembatik: object["data"]["nama_pembatik"],
        namaPaguyuban: object["data"]["paguyuban"],
        namaMotif: object["data"]["motif"],
        namaPewarna: object["data"]["pewarnaan"],
        grade: object["data"]["grade"],
        desc: object["data"]["deskripsi"],
        urlImg: object["data"]["img_url"],
        filosofi: object["data"]["filosofi"]);
  }

  static Future<GetItem> connectToApi(String codeScan) async {
    var response = await http.get(
        Uri.parse("https://batiknitikjogja.com/api/fetchcode/" + codeScan));
    var responseObject = json.decode(response.body);
    return GetItem.getData(responseObject);
  }
}
