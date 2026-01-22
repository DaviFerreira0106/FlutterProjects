import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu = true;
  Tabuleiro _tabuleiro = Tabuleiro(linhas: 3, colunas: 3, qtdDeBombas: 3);

  _reiniciar() {
    print('reiniciar...');
  }

  void _abrir(Campo campo) {
    print('abrir....');
  }

  void _alternarMarcacao(Campo campo) {
    print('Aternar Marcação....');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(venceu: _venceu, onReiniciar: _reiniciar),
        body: TabuleiroWidget(
          tabuleiro: _tabuleiro,
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }
}
