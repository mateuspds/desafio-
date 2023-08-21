import 'package:desafio/models/perguntas.dart';
import 'package:desafio/utils/questionarios_json.dart';

class QuestionarioRepository {
  static Future<Teste> buscar() async {
    try {
      return Teste.fromJson(perguntas);
    } catch (e) {
      throw Exception("erro desconhecido");
    }
  }
}
