class Alternativas {
  int id = 0;
  String titulo = "";
  Alternativas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
  }
}

class Perguntas {
  int id = 0;
  String titulo = "";
  String pergunta = "";
  int gabarito = 0;
  List<Alternativas> altenativas = [];

  Perguntas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    pergunta = json['pergunta'];
    gabarito = json['gabarito'];
    altenativas = <Alternativas>[
      ...(json['alternativas'] ?? [])
          .map((e) => Alternativas.fromJson(e))
          .toList()
    ];
  }
}

class Teste {
  Questionario? questionario;

  Teste.fromJson(Map<String, dynamic> json) {
    questionario = json['questionario'] != null
        ? Questionario.fromJson(json['questionario'])
        : null;
  }
}

class Questionario {
  int id = 0;
  String titulo = "";
  List<Perguntas> perguntas = [];

  Questionario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    perguntas = <Perguntas>[
      ...(json['questoes'] ?? []).map((e) => Perguntas.fromJson(e)).toList()
    ];
  }
}
