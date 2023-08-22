import 'package:desafio/models/perguntas.dart';
import 'package:desafio/modules/Home/paginas/pontuacao.dart';
import 'package:desafio/widgets/questao.dart';
import 'package:desafio/widgets/resposta.dart';
import 'package:flutter/material.dart';

class QuestionarioWidget extends StatefulWidget {
  final Questionario q;
  const QuestionarioWidget({super.key, required this.q, this.res});
  final List<int>? res;

  @override
  State<QuestionarioWidget> createState() => _QuestionarioWidgetState();
}

class _QuestionarioWidgetState extends State<QuestionarioWidget> {
  late Questionario q = widget.q;
  int index = 0;
  int pontuacao = 0;
  List<int> respostas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(q.titulo),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Questao(
            texto: q.perguntas[index].pergunta,
          ),
          Resposta(
            alternativa: widget.res != null ? widget.res![index] : null,
            cor: widget.res != null &&
                    widget.res?[index] == q.perguntas[index].gabarito
                ? Colors.green
                : widget.res != null &&
                        widget.res?[index] != q.perguntas[index].gabarito
                    ? Colors.red
                    : null,
            texto: q.perguntas[index].altenativas,
            quandoSelecionado: (e) {
              respostas.add(e);
              if (e == q.perguntas[index].gabarito) {
                pontuacao++;
              }
              if (q.perguntas.length - 1 > index) {
                setState(() {
                  index++;
                });
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pontuacao(
                      resp: respostas,
                      pontos: pontuacao,
                      totalQuestoes: q.perguntas.length,
                      q: q,
                    ),
                  ),
                );
              }
            },
          ),
          if (widget.res != null) ...[
            const Spacer(),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (q.perguntas.length - 1 > index) {
                    setState(() {
                      index++;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pontuacao(
                          resp: respostas,
                          pontos: pontuacao,
                          totalQuestoes: q.perguntas.length,
                          q: q,
                        ),
                      ),
                    );
                  }
                },
                child: const Text("continuar"),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
