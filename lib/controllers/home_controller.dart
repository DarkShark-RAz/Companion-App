import 'dart:math';

import 'package:companion_app/models/quotes_model.dart';
import 'package:companion_app/models/video_model.dart';
import 'package:companion_app/services/api/quotes_api_service.dart';
import 'package:companion_app/services/api/remote_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var isLoading = true.obs;
  var videoList = Snippet().obs;
  var pgToken = 'EAAaBlBUOkNBVQ'.obs;

  var snippetList = <Snippet>[].obs;
  var quoteList = <QuotesModel>[].obs;
  var quote = "".obs;
  get quoteText => quote.value;
  set quoteText(value) => quote.value = value;

  void fetchVideos() async {
    try {
      isLoading(true);
      snippetList.clear();
      var videos = await RemoteServices.fetchVideos(pgToken.value);
      // print('------------------ ${pgToken.value}');
      pgToken.value = videos.nextPageToken!;
      // print('------------------updated------- ${pgToken.value}');
      List<Item>? dat = videos.items;
      List<Snippet?> data = dat!.map((e) => e.snippet).toList();
      for (int i = 0; i < data.length; i++) {
        snippetList.add(data[i]!);
      }
      // for (var l in snippetList) {
      //   print(l.title);
      //   print(l.thumbnails!.high!.url);
      //   print(l.resourceId?.videoId);
      // }
    } finally {
      isLoading(false);
    }
  }

  void fetchQuotes() async {
    Random random = Random();
    try {
      isLoading(true);
      quoteList.clear();
      var quotes = await QuotesApiService.fetchQuotes();
      // print('------------------ ${quotes.length}');
      List data = quotes.map((e) => e.text).toList();
      for (int i = 0; i < data.length; i++) {
        quoteList.add(QuotesModel(text: data[i] as String));
      }
      var _randomNumber = random.nextInt(quoteList.length);
      quoteText = quoteList[_randomNumber].text!;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  @override
  void onReady() {
    fetchVideos();

    super.onReady();
  }

  @override
  void onClose() {}
}
