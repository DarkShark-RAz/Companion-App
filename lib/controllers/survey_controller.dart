import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  static SurveyController get to => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _progressNum = 1.obs;
  get progressNum => this._progressNum.value;
  set progressNum(value) => this._progressNum.value = value;

  final _nightProgressNum = 1.obs;
  get nightProgressNum => this._nightProgressNum.value;
  set nightProgressNum(value) => this._nightProgressNum.value = value;

  final _isCard0Selected = false.obs;
  get isCard0Selected => this._isCard0Selected.value;
  set isCard0Selected(value) => this._isCard0Selected.value = value;

  final _isCard1Selected = false.obs;
  get isCard1Selected => this._isCard1Selected.value;
  set isCard1Selected(value) => this._isCard1Selected.value = value;

  final _isCard2Selected = false.obs;
  get isCard2Selected => this._isCard2Selected.value;

  set isCard2Selected(value) => this._isCard2Selected.value = value;

  final _isCard3Selected = false.obs;

  get isCard3Selected => this._isCard3Selected.value;

  set isCard3Selected(value) => this._isCard3Selected.value = value;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void turnOffAllSelections() {
    isCard0Selected = false;
    isCard1Selected = false;
    isCard2Selected = false;
    isCard3Selected = false;
  }

  void Card0Selected() {
    turnOffAllSelections();
    isCard0Selected = true;
  }

  void Card1Selected() {
    turnOffAllSelections();
    isCard1Selected = true;
  }

  void Card2Selected() {
    turnOffAllSelections();
    isCard2Selected = true;
  }

  void Card3Selected() {
    turnOffAllSelections();
    isCard3Selected = true;
  }

  void updateProgressNumber() {
    if (isCard0Selected ||
        isCard1Selected ||
        isCard2Selected ||
        isCard3Selected) {
      if (progressNum == 9) {
        // TODO : pass values into database
        Get.offAllNamed('/priority-task');
      } else {
        progressNum += 1;
        turnOffAllSelections();
      }
    }
  }

  void updateNightProgressNumber() {
    if (isCard0Selected ||
        isCard1Selected ||
        isCard2Selected ||
        isCard3Selected) {
      if (nightProgressNum == 6) {
        // TODO : pass values into database
        Get.offAllNamed('/main-screen', arguments: auth.currentUser);
      } else {
        nightProgressNum += 1;
        turnOffAllSelections();
      }
    }
  }

  @override
  void onClose() {}
}
