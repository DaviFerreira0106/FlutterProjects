abstract class Pergunta {
  // Atributos
  final List<Map<String, Object>> _listaPergunta = const [
    {
      "questao": "Qual sua cor favorita?",
      "alternativa": [
        {"texto": "Branco", "pontuacao": 10},
        {"texto": "Verde", "pontuacao": 8},
        {"texto": "Azul", "pontuacao": 4},
        {"texto": "Vermelho", "pontuacao": 1},
      ],
    },
    {
      "questao": "Qual seu animal favorito?",
      "alternativa": [
        {"texto": "Leão", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 8},
        {"texto": "Macaco", "pontuacao": 4},
        {"texto": "Gavião", "pontuacao": 1},
      ],
    },
    {
      "questao": "Qual seu instrutor favorito?",
      "alternativa": [
        {"texto": "Davi", "pontuacao": 10},
        {"texto": "Laura", "pontuacao": 8},
        {"texto": "Mariana", "pontuacao": 4},
        {"texto": "Elenita", "pontuacao": 1},
      ],
    },
  ];
 
  int? _listaIndex;
  int? _pontuacaoTotal;

  // Construtor
  Pergunta({int? index, int? pontuacaoTotal}){
    setListaIndex = index!;
    setPontuacaoTotal = pontuacaoTotal!;
  }

  // Getters e Setters
  set setListaIndex(int index) {
    _listaIndex = index;
  }

  set setPontuacaoTotal(int pontuacao){
    _pontuacaoTotal = pontuacao;
  }

  List<Map<String, Object>> get getListaPergunta {
    return _listaPergunta;
  }

  int get getListaIndex {
    return _listaIndex!;
  }

  int get getPontuacaoTotal {
    return _pontuacaoTotal!;
  }

  // Metodos
  void responder(int pontuacao);

  void reiniciar();
}