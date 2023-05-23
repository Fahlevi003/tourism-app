import 'package:app_tourism/source/wisata_source.dart';
import 'package:get/get.dart';

import '../model/wisata.dart';

class CWisata extends GetxController {
  final _category = 'All Place'.obs;
  String get category => _category.value;
  set category(n) {
  _category.value = n;
  update();
  }

  List<String> get categories => [
    'All Place',
    'Pantai',
    'Gunung',
  ];

  final _listWisata = <Wisata>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Wisata> get listWisata => _listWisata.value;

  getListWisata() async {
    _listWisata.value = await WisataSource.getWisata();
    update();
  }

  @override
  void onInit() {
    getListWisata();
    super.onInit();
  }
}