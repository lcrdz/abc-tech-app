import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssistService extends GetxService {
  late AssistProviderI assistProviderI;

  AssistService({required this.assistProviderI});

  Future<List<Assist>> getAssists() async {
    Response response = await assistProviderI.getAssists();

    if (response.hasError) {
      return Future.error(ErrorDescription("Erro na conexão"));
    }

    try {
      List<Assist> assists = response.body
          .map<Assist>((assist) => Assist.fromMap(assist))
          .toList();
      return Future.sync(() => assists);
    } catch (e) {
      e.printError();
      return Future.error(e.toString());
    }
  }
}
