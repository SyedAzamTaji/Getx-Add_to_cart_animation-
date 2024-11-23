import 'package:addtocart/data/data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<RxInt> count = List.generate(ProductData.length, (index) => 1.obs);
  RxList<String> selectedImages = <String>[].obs;
  increament(int index) {
    count[index].value++;
  }

  decreament(int index) {
    if (count[index].value > 1) {
      count[index].value--;
    }
  }

  void addImage(String image) {
    selectedImages.add(image);
  }
}
