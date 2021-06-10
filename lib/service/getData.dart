import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class GetBarcode {
  String status;

  GetBarcode({
    required this.status,
  });
  factory GetBarcode.getData(Map<String, dynamic> object) {
    return GetBarcode(
      status: object["status"],
    );
  }

  static Future<GetBarcode> connectToApi(String codeScan) async {
    var response = await http.get(
        Uri.parse("http://batik.futsaloka.my.id/api/fetchcode/" + codeScan));
    var responseObject = json.decode(response.body);
    return GetBarcode.getData(responseObject);
  }
}
