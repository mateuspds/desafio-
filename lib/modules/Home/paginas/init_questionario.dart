import 'package:desafio/models/perguntas.dart';
import 'package:flutter/material.dart';

class QuestionarioWidget extends StatefulWidget {
  final Questionario q;
  const QuestionarioWidget({
    super.key,
    required this.q,
  });

  @override
  State<QuestionarioWidget> createState() => _QuestionarioWidgetState();
}

class _QuestionarioWidgetState extends State<QuestionarioWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
      ),
    );
  }
}
