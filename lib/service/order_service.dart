import 'package:abctechapp/model/order.dart';
import 'package:abctechapp/provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/order_created.dart';

abstract class OrderServiceI {
  Future<OrderCreated> createOrder(Order order);
}

class OrderService extends GetxService implements OrderServiceI {
  final OrderProviderI _provider;

  OrderService(this._provider);

  @override
  Future<OrderCreated> createOrder(Order order) async {
    Response response = await _provider.postOrder(order);
    if (response.hasError) {
      return Future.error(ErrorDescription('Erro na conexão'));
    }

    try {
      return Future.sync(() => OrderCreated(success: true, message: ''));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription('Erro não esperado'));
    }
  }
}
