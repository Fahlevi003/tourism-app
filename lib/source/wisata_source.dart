import 'package:app_tourism/model/wisata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WisataSource {
  static Future<List<Wisata>> getWisata() async {
    var result = await FirebaseFirestore.instance.collection('Wisata').get();
    return result.docs.map((e) => Wisata.fromJson(e.data())).toList();
  } 
}