import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 50,
            ),
            /*Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                // color: Colors.white,
                image: DecorationImage(
                    scale: 3,
                    fit: BoxFit.scaleDown,
                    image: AssetImage(
                      'assets/images/undraw_Mobile_development_re_wwsn.png',
                    ),
                    alignment: Alignment.topCenter),
              ),
            ),*/
            Container(
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Introdução aos Exercícios de Kegel',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "O Assoalho pélvico é uma estrutura complexa e vulnerável, composta por músculos, fáscias e ligamentos que desempenham um papel fundamental no suporte dos órgãos abdominais e pélvicos e continência urinária e fecal. (MORENO et al., 2021).",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "O déficit de força muscular ou incoordenação da musculatura do assoalho pélvico podem contribuir com o surgimento de algumas disfunções, dentre as quais têm destaque a incontinência urinária, incontinência fecal, prolapsos génitais e disfunções sexuais. (COELHO e HADDAD, 2020).",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "A fisioterapia desempenha um papel crucial como uma abordagem de tratamento conservador, oferecendo cuidados personalizados aos pacientes. Ela emprega uma variedade de técnicas que visam fortalecer e conscientizar o assoalho pélvico (FILHO, FONSECA e CANGUSSU, 2013).",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Uma dessas técnicas é o Treinamento do assoalho pélvico – TMAP. O TMAP é composto por diversos exercícios para que ajudam a melhorar a força muscular do assoalho pélvico, resistência, percepção e consciência dos movimentos. Uma musculatura funcional evita vazamento de urina e outras disfunções (Silva, 2023).",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CircleAvatar(
                maxRadius: 8,
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: const Text('AVANÇAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
