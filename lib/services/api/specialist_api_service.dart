import 'package:companion_app_nihar/models/specialist_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SpecialistApiService {
  static var client = http.Client();

  static Future<List<SpecialistModel>> fetchSpecialists(String city) async {
    var response = await client.get(Uri.parse(
        'http://raw.githubusercontent.com/DarkShark-RAz/therapists-data/main/$city.json'));
    if (response.statusCode != 200) {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
    var jsonString = response.body;
    return specialistFromJson(jsonString);
  }
}
