import 'package:companion_app_nihar/models/specialist_model.dart';
import 'package:companion_app_nihar/services/api/specialist_api_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SpecialistController extends GetxController {
  static SpecialistController get to => Get.find();
  var isLoading = true.obs;
  var specialistList = <SpecialistModel>[].obs;
  var addressList = <Placemark>[].obs;
  // int? index = Get.arguments;

  final _selectedCity = 'jaipur'.obs;

  get selectedCity => this._selectedCity.value;

  set selectedCity(value) => this._selectedCity.value = value;

  final _lat = 0.0.obs;

  get lat => this._lat.value;

  set lat(value) => this._lat.value = value;

  final _long = 0.0.obs;

  get long => this._long.value;

  set long(value) => this._long.value = value;

  @override
  void onInit() {
    super.onInit();
    determinePosition();
    fetchSpecialists(selectedCity);
    // fetchAddress(index ?? 0);
  }

  updateCity(String value) {
    if (value != selectedCity) {
      selectedCity = value;
      fetchSpecialists(selectedCity);
    }
  }

  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position coordinates = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = coordinates.latitude;
    long = coordinates.longitude;

    // print('latitude: $lat');
    // print('longitude: $long');
    // print(calculateInBetweenDist("26.8402924", "75.75751919999999"));
  }

  // double calculateInBetweenDist(String? endLat, String? endLong) {
  //   return Geolocator.distanceBetween(
  //       lat, long, double.parse(endLat!), double.parse(endLong!));
  // }

  void fetchAddress(int indx) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(specialistList[indx].latitude!),
        double.parse(specialistList[indx].longitude!),
        localeIdentifier: 'en_US');
    addressList.assign(placemarks[indx]); // assign replaces in the list
  }

  void fetchSpecialists(String city) async {
    try {
      isLoading(true);
      var specialists = await SpecialistApiService.fetchSpecialists(city);
      specialistList.assignAll(specialists);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() async {
    super.onReady();
    // fetchAddress(index ?? 0);
  }

  @override
  void onClose() {}
}
