import 'package:desafio/modules/Home/paginas/pagina_inicial.dart';
import 'package:flutter/material.dart';

class Pontuacao extends StatelessWidget {
  final int pontos;
  final int totalQuestoes;
  final List<int> resp;
  const Pontuacao(
      {super.key,
      required this.pontos,
      required this.totalQuestoes,
      required this.resp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {},
              child: const Text("ver gabarito"),
            ),
          ),
        ],
      ),
    );
  }
}
