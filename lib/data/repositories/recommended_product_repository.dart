import 'package:fooddelivery/data/api/api_client.dart';
import 'package:fooddelivery/utils/app_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
