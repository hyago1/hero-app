
import 'package:dio/dio.dart';
import 'package:projetopdm/model/hero.dart';



List<HeroModel> heros = [];

Future<dynamic> fetch() async {
  final dio = Dio();
  final String _baseUrl = 'http://10.0.2.2:3000/hero';
  try {
    Response response = await dio.get(_baseUrl);

    if (response.statusCode == 200) {
      // 1. O Dio retorna uma lista dinâmica (List<dynamic>)
      final List<dynamic> heroData = response.data;

      // 2. Mapeia cada item do JSON para um objeto Hero

      for (var hr in heroData) {
        heros.add(HeroModel.fromJson(hr));
      }
      return heros;
    } else {
      print('Erro ao carregar dados: ${response.statusCode}');
    } }catch (e) {
    print('Erro ao carregar heróis: ${e}');
  }
}


