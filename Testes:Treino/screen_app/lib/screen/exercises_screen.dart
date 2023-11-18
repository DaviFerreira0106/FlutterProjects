import 'package:flutter/material.dart';
import 'package:screen_app/screen/appbar_custom.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton(
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    size: 35,
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text(''),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
        title: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
          child: const Text(
            'Exercícios',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 300,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: AppBarCustom(),
          child: Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 60,
              ),
              child: Icon(
                Icons.view_list_rounded,
                size: 35,
                color: Colors.white,
              ),
            ),
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/backabstract.jpeg'),
              ),
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurple.shade500],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: const Text(
                              'Respiração',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Exercicios de Kegel atraves da respiração',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99),
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: const Text(
                              'Contração',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Exercicios de Kegel atraves de contrações',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99),
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: const Text(
                              'Exercício de ponte',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Exercicite a região pelvica a partir do quadril',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99),
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 8,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: const Text(
                              'Exercício de agachamento',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Exercicios de Kegel atraves de agachamentos',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 99, 99, 99),
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (_) {},
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
