import 'package:flutter/material.dart';

class ExercisesDetailScreen extends StatefulWidget {
  const ExercisesDetailScreen({super.key});

  @override
  State<ExercisesDetailScreen> createState() => _ExercisesDetailScreenState();
}

class _ExercisesDetailScreenState extends State<ExercisesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/exercicio_de_ponte.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.black45,
                              child: CircleAvatar(
                                child: Text('8x'),
                                backgroundColor: Colors.black54,
                                radius: 40,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        backgroundColor: Colors.greenAccent,
                                      ),
                                      title: Text(
                                        'Deite-se de costas, joelhos dobrados, pés bem apoiados ao solo e afastados na largura do quadril',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                    title: Text(
                                      'Inspire e contraia o assoalho pélvico',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                    title: Text(
                                      'Levante os quadris segurando a contração do assoalho pélvico.',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                        '4',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                    title: Text(
                                      'Expire e abaixe os quadris e relaxe o assoalho pélvico',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
