import 'package:desafio/models/perguntas.dart';
import 'package:desafio/modules/Home/paginas/init_questionario.dart';
import 'package:flutter/material.dart';

import '../../../repositorios/questionario_repository.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  late Teste questionario;
  buscarPerguntas() async {
    try {
      final resposta = await QuestionarioRepository.buscar();
      setState(() {
        questionario = resposta;
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) {
            return const AlertDialog(
              title: Text("erro"),
              content: Row(
                children: [
                  Center(
                    child: Text("erro ao pesquisar as perguntas"),
                  )
                ],
              ),
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    buscarPerguntas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("perguntas "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuestionarioWidget(q: questionario.questionario!),
                    ),
                  );
                },
                child: const Text("Começar"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
