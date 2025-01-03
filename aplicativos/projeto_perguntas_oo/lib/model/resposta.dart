import 'package:projeto_perguntas_oo/model/pergunta.dart';

class Resposta extends Pergunta {
  // Atributo
  String? _texto;

  // Construtor
  Resposta({String? texto}){
    setTexto = texto;
  }

  // Getters e Setters
  set setTexto(String? texto){
    _texto = texto;
  }

  String get getTexto {
    return _texto!;
  }

  // Metodos
  @override
  void responder(int pontuacao){
    // Incremento do index
    int index = getListaIndex;
    index++; 
    setListaIndex = index;

    // Calculo da pontuação total
    int total = getPontuacaoTotal;
    total += pontuacao;
    setPontuacaoTotal = total;
  }

  @override
  void reiniciar(){
    setListaIndex = 0;
    setPontuacaoTotal = 0;
  }
}