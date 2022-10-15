import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/service/assist_service.dart';
import 'package:get/get.dart';

class AssistController extends GetxController with StateMixin<List<Assist>> {
  late AssistService _service;
  List<Assist> assists = [];
  List<Assist> selectedAssists = [];

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistService>();
    getAssistList();
  }

  void getAssistList() {
    change([], status: RxStatus.loading());
    _service.getAssists().then((value) {
      assists = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  finshSelectAssists() {
    Get.back();
  }

  selectAssist(int index) {
    Assist assist = assists[index];
    int indexFound =
        selectedAssists.indexWhere((element) => element.id == assist.id);
    if (indexFound == -1) {
      selectedAssists.add(assist);
    } else {
      selectedAssists.removeAt(indexFound);
    }

    change(assists, status: RxStatus.success());
  }

  bool isSelected(int index) {
    Assist assist = assists[index];
    int indexFound =
        selectedAssists.indexWhere((element) => element.id == assist.id);
    return indexFound != -1;
  }
}
