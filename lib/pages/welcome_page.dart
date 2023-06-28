import 'package:flutter/material.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 74, 74),
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
              'assets/usuario2bar.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Marcelo Ontaneda'),
              accountEmail: const Text('ontanedamarcelo74@gmail.com'),
              currentAccountPicture: Image.asset('assets/ferreteria.png'),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 77, 74, 74),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline_rounded),
              title: const Text('Perfil'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuracion'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Bienvenidos al sistema',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.0),
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 77, 74, 74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/home");
                },
                child: ListTile(
                  title: Text(
                    'Productos',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset("assets/product.jpeg"),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 77, 74, 74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Proveedores',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset("assets/proveedores.png"),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 77, 74, 74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Clientes',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset("assets/clientes.jpeg"),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 77, 74, 74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Compañia',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset("assets/compania.png"),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 77, 74, 74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Almacen',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset('assets/almacen.png'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
