import 'package:fooddelivery/data/api/api_client.dart';
import 'package:fooddelivery/utils/app_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
