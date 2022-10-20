import 'package:abctechapp/model/order.dart';
import 'package:get/get.dart';

import '../constants.dart';

abstract class OrderProviderI {
  Future<Response> postOrder(Order order);
}

class OrderProvider extends GetConnect implements OrderProviderI {
  @override
  Future<Response> postOrder(Order order) =>
      post('${Constants.url}/order', order.toMap());
}
