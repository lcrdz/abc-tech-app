import 'package:abctechapp/pages/home_bind.dart';
import 'package:abctechapp/pages/home_page.dart';
import 'package:abctechapp/pages/order_bind.dart';
import 'package:abctechapp/pages/order_page.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:abctechapp/service/assist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() {
  Get.lazyPut(() => AssistService(assistProviderI: AssistProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ABC Tech App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => const OrderPage(), binding: OrderBind()),
        GetPage(
            name: '/assists',
            page: () => const HomePage(),
            binding: HomeBinding()),
      ],
    );
  }
}
