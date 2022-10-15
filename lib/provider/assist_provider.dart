import 'package:abctechapp/constants.dart';
import 'package:get/get_connect.dart';

abstract class AssistProviderI {
  Future<Response> getAssists();
}

class AssistProvider extends GetConnect implements AssistProviderI {
  @override
  Future<Response> getAssists() => get('${Constants.url}/assistance');
}
