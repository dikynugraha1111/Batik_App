import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class GetBarcode {
  String status;
  String name;

  GetBarcode({required this.status, required this.name});
  factory GetBarcode.getData(Map<String, dynamic> object) {
    return GetBarcode(
      status: object["meta"]["status"],
      name: object["data"]["name"],
    );
  }

  static Future<GetBarcode> connectToApi(String codeScan) async {
    var response = await http
        .get(Uri.parse("http://www.futsaloka.my.id/api/batik/" + codeScan));
    var responseObject = json.decode(response.body);
    return GetBarcode.getData(responseObject);
  }
}
