import 'package:desafio/models/perguntas.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final List<Alternativas> texto;
  final Function(int) quandoSelecionado;
  const Resposta(
      {super.key,
      required this.texto,
      required this.quandoSelecionado,
      this.cor,
      this.alternativa});
  final Color? cor;
  final int? alternativa;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < texto.length; i++)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: alternativa == texto[i].id ? cor : Colors.blue,
              ),
              onPressed: () {
                quandoSelecionado(texto[i].id);
              },
              child: Text(
                texto[i].titulo,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
