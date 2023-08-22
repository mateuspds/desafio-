import 'package:desafio/modules/Home/paginas/init_questionario.dart';
import 'package:desafio/modules/Home/paginas/pagina_inicial.dart';
import 'package:flutter/material.dart';
import '../../../models/perguntas.dart';

class Pontuacao extends StatelessWidget {
  final Questionario q;
  final int pontos;
  final int totalQuestoes;
  final List<int> resp;
  const Pontuacao(
      {super.key,
      required this.pontos,
      required this.totalQuestoes,
      required this.resp,
      required this.q});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("pontuação"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("parabens sua pontuação foi de "),
          ),
          Text("${pontos.toString()}/${totalQuestoes.toString()} pontos"),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaInicial(),
                  ),
                );
              },
              child: const Text("Página inicial"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionarioWidget(
                      q: q,
                      res: resp,
                    ),
                  ),
                );
              },
              child: const Text("ver gabarito"),
            ),
          ),
        ],
      ),
    );
  }
}
