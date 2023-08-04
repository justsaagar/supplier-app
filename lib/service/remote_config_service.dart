import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supplier/service/rest_service.dart';
import 'package:supplier/utils/string_extensions.dart';
import 'package:supplier/utils/utils.dart';

class RemoteConfigProvider extends GetxController {
  CollectionReference userCollection = FirebaseFirestore.instance.collection('base_url');

  Future<void> getCurrentUser() async {
    try {
      DocumentSnapshot documentSnapshot = await userCollection.doc('JoinLocal').get();
      logs('Document --> ${documentSnapshot.data()}');
      Map<String, dynamic> responseMap = documentSnapshot.data() as Map<String, dynamic>;
      if (kReleaseMode) {
        RestConstants.instance.supplierBaseUrl = responseMap['storeAdminProd'];
      } else {
        RestConstants.instance.supplierBaseUrl = responseMap['storeAdminDev'];
      }
      // RestConstants.instance.supplierBaseUrl = responseMap['storeAdminVersion'];
    } on FirebaseException catch (e) {
      e.message.toString().showError();
    }
  }
}
