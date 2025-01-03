class Resultado {
  int? _pontuacao;

  Resultado({int? pontuacao}){
    setPontuacao = pontuacao;
  }

  set setPontuacao(int? pontuacao){
    _pontuacao = pontuacao;
  }

  int get getPontuacao {
    return _pontuacao == null ? 0 : _pontuacao!;
  }

  String get frasePontuacao {
    if (getPontuacao < 8) {
      return "Parabens!";
    } else if (getPontuacao < 12) {
      return "Você é Bom!";
    } else {
      return "Você é muito Bom!";
    }
  }
}