import 'package:dio/dio.dart';
import 'package:ella/app/shared/custom_dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'ella_web_repository.g.dart';

@Injectable()
class EllaWebRepository extends Disposable {
  final CustomDio dio;

  EllaWebRepository(this.dio);

  Future postEstimates(Map<String, dynamic> data) async {
    try {
      var resp = await dio.client.post('/api/estimates', data: data);
      return resp.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
