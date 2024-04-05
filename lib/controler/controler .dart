import 'package:get/get.dart';
import 'package:shop_app/Remoteseervide/servises.dart';
import 'package:shop_app/model/productmodel.dart';

class productcontrler extends GetxController {
  var productList = <Welcome>[].obs; // Create an observable of type Welcome

  @override
  void onInit() {
    fetechproduct();
    // Add initial data or API calls to fetch data here
    super.onInit();
  }

  void fetechproduct() async {
    var product = await Remoteservises.fetchproduct();
    if (product != null) {
      productList.value = product;
    }
  }

  // Add more methods and functionality as needed
}
