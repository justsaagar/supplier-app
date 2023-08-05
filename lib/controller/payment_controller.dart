import 'package:get/get.dart';

class PaymentController extends GetxController{
  int currentIndex = 0;

  void onTabChanged(index){
    currentIndex = index;
    update();
  }
}