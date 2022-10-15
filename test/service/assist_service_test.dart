import 'dart:convert';
import 'dart:io';

import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:abctechapp/service/assist_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';

@GenerateMocks([AssistProviderI])
void main() {
  late AssistService service;
  late MockAssistProviderI provider;

  setUp(() async {
    provider = MockAssistProviderI();
    service = AssistService(assistProviderI: provider);

    String json =
        File('${Directory.current.path}/test/resources/assist_response.json')
            .readAsStringSync();
    when(provider.getAssists()).thenAnswer((_) async => Future.sync(
        (() => Response(statusCode: HttpStatus.ok, body: jsonDecode(json)))));
  });

  test('Should return assists list when response is success', () async {
    List<Assist> assists = await service.getAssists();
    expect(assists.length, 2);
    expect(assists[0].id, 1);
  });
}
