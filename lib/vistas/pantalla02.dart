import 'package:flutter/material.dart';
import 'pantalla01.dart';
import 'home.dart';

class Pantalla02 extends StatefulWidget {
  final String cedula;
  final String nombre;
  final String jugadorfav;
  const Pantalla02(
      {super.key,
      required this.cedula,
      required this.nombre,
      required this.jugadorfav});

  @override
  State<Pantalla02> createState() => _Pantalla02State();
}

class _Pantalla02State extends State<Pantalla02> {
  TextEditingController controllerCedula = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerJugadorFav = TextEditingController();
  @override
  void initState() {
    // Valor inicial
    super.initState();
    controllerCedula.text = widget.cedula;
    controllerName.text = widget.nombre;
    controllerJugadorFav.text = widget.jugadorfav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Pantalla'),
        backgroundColor: Colors.blue[800],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('SaloGOAT Rondón'),
              accountEmail: Text('saloelgladiador@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 107, 8, 33),
                child: Text(
                  'R',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 158, 105, 79)),
            ),
            ListTile(
              title: const Text('Bienvenidos'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            ListTile(
              title: const Text('pantalla 1'),
              leading: const Icon(Icons.stay_current_landscape_sharp),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pantalla01()));
              },
            ),
            ListTile(
              title: const Text('Pantalla 2'),
              leading: const Icon(Icons.stay_current_landscape_sharp),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pantalla02(
                        cedula: controllerCedula.text,
                        nombre: controllerName.text,
                        jugadorfav: controllerJugadorFav.text,
                      ),
                    ));
              },
            ),
            ListTile(
              title: const Text('Salir'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fondo.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(10),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Datos personales',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  const Text(
                    'Cedula:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 38),
                  Expanded(
                    child: TextField(
                      controller: controllerCedula,
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        //border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Nombre:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: TextField(
                      controller: controllerName,
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        //border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Jugador Favorito:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controllerJugadorFav,
                      readOnly: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        //border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Regresar',
                    style: TextStyle(
                        color: Color.fromARGB(255, 71, 31, 40),
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text(
                    'Inicio',
                    style: TextStyle(
                        color: Color.fromARGB(255, 71, 31, 40),
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
