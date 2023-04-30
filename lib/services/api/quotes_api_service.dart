import 'package:companion_app_nihar/models/quotes_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QuotesApiService {
  static var client = http.Client();

  static Future<List<QuotesModel>> fetchQuotes() async {
    var response = await client.get(Uri.parse('https://type.fit/api/quotes'));
    if (response.statusCode != 200) {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
    var jsonString = response.body;
    return quotesModelFromJson(jsonString);
  }
}
