import 'package:desafio/models/perguntas.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final List<Alternativas> texto;
  final Function(int) quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in texto)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                quandoSelecionado(item.id);
              },
              child: Text(
                item.titulo,
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
