import 'package:flutter/material.dart';
import 'package:crud_firebase/pages/home_page.dart';
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
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                alignment: Alignment.center,
                child: const Text(
                  'Bienvenido al sistema',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              CardListItem(
                icon: Icons.image,
                title: 'Productos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              Image.asset(
                'assets/product.jpeg',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              CardListItem(
                icon: Icons.image,
                title: 'Proveedores',
              ),
              Image.asset(
                'assets/proveedores.png',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              CardListItem(
                icon: Icons.image,
                title: 'Clientes',
              ),
              Image.asset(
                'assets/clientes.jpeg',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              CardListItem(
                icon: Icons.image,
                title: 'Compañia',
              ),
              Image.asset(
                'assets/compania.png',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
              CardListItem(
                icon: Icons.image,
                title: 'Almacen',
              ),
              Image.asset(
                'assets/almacen.png',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const CardListItem({
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 77, 74, 74),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
