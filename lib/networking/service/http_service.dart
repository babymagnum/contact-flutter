import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/networking/service/base_service.dart';
import 'package:skor_id_flutter/utils/helper/dio_adapter_mock.dart';
import '../../main.dart';

class HttpService extends BaseService {
  static final HttpService _instance = HttpService._internal();

  HttpService._internal();

  factory HttpService() => _instance;

  Future<List<ContactList>> getContact({DioAdapterMock? mock}) async {
    return await getList(
        url: '${commonController.appConfig.value.baseUrl}/contacts', mock: mock);
  }

}
