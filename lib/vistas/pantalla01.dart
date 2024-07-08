import 'package:flutter/material.dart';
import 'package:flutter_application_2/vistas/home.dart';
import './pantalla02.dart';

const List<String> list = <String>['Masculino', 'Femenino', 'Otro'];

class Pantalla01 extends StatefulWidget {
  const Pantalla01({super.key});
  @override
  State<Pantalla01> createState() => _Pantalla01State();
}

class _Pantalla01State extends State<Pantalla01> {
  String sexo = list.first;
  final TextEditingController controllerCedula = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDireccion = TextEditingController();
  final TextEditingController controllerTelefono = TextEditingController();
  final TextEditingController controllerSueldoNeto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primera Pantalla'),
        backgroundColor: Colors.blue[800],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('SaloGOAT Rondón'),
              accountEmail: Text('saloelgladiador@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/rondon.jpg"),
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
                        jugadorfav: controllerSueldoNeto.text,
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
            //mainAxisAlignment: MainAxisAlignment.center,
            padding: const EdgeInsets.all(10),
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
                  const SizedBox(width: 42),
                  Expanded(
                    child: TextField(
                      controller: controllerCedula,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
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
                  const SizedBox(width: 35),
                  Expanded(
                    child: TextField(
                      controller: controllerName,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
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
                    'Direccion:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 23),
                  Expanded(
                    child: TextField(
                      controller: controllerDireccion,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
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
                    'Telefono:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 27),
                  Expanded(
                    child: TextField(
                      controller: controllerTelefono,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
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
                    'Sexo:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 53),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        value: sexo,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onChanged: (String? value) {
                          setState(() {
                            sexo = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Sueldo:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controllerSueldoNeto,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pantalla02(
                          cedula: controllerCedula.text,
                          nombre: controllerName.text,
                          jugadorfav: controllerSueldoNeto.text,
                        ),
                      ));
                },
                child: const Text(
                  'Más Detalles',
                  style: TextStyle(
                      color: Color.fromARGB(255, 71, 31, 40),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text(
                    'Salir',
                    style: TextStyle(
                        color: Color.fromARGB(255, 71, 31, 40),
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
