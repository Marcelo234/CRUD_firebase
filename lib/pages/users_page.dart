import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

import 'QrScanPage.dart';
import 'login_page.dart';
import 'perfil_page.dart';
import 'welcome_page.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Usuarios'),
        backgroundColor: Colors.grey[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Marcelo Ontaneda'),
              accountEmail: Text('ontanedamarcelo74@gmail.com'),
              currentAccountPicture: Image.asset('assets/ferreteria.png'),
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline_rounded,
              ),
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuracion'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.qr_code_scanner),
              title: Text('Escanear codigo QR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrScanPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Regresar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: getUsers(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deleteUsers(snapshot.data?[index]['oid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;

                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  '¿Estas seguro de eliminar ${snapshot.data?[index]['nombre']}?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(
                                        context,
                                        false,
                                      );
                                    },
                                    child: const Text('Cancelar',
                                        style: TextStyle(color: Colors.red))),
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(
                                        context,
                                        true,
                                      );
                                    },
                                    child: const Text('Si, estoy seguro'))
                              ],
                            );
                          });

                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    direction: DismissDirection.endToStart,
                    key: Key(snapshot.data?[index]['oid']),
                    child: ListTile(
                      title: Container(
                        color: Colors.grey[900], // Establece el color de fondo gris
                        padding: const EdgeInsets.all(
                            16.0), // Añade un padding al Container si es necesario
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.label_outline,
                                    color:
                                        Colors.white), // Añade el primer icono
                                SizedBox(
                                    width:
                                        8.0), // Espacio horizontal entre el icono y el texto
                                Text(
                                  'Nombre:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Establece el color del texto
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index]['nombre']}',
                              style: const TextStyle(
                                  color: Colors
                                      .white), // Establece el color del texto
                            ),
                            const SizedBox(
                                height:
                                    8.0), // Espacio vertical entre las líneas
                            const Row(
                              children: [
                                Icon(Icons.description,
                                    color:
                                        Colors.white), // Añade el segundo icono
                                SizedBox(
                                    width:
                                        8.0), // Espacio horizontal entre el icono y el texto
                                Text(
                                  'Correo electronico:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Establece el color del texto
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index]['correo']}',
                              style: const TextStyle(
                                  color: Colors
                                      .white), // Establece el color del texto
                            ),
                            const SizedBox(
                                height:
                                    8.0), // Espacio vertical entre las líneas
                            const Row(
                              children: [
                                Icon(Icons.shopping_cart,
                                    color:
                                        Colors.white), // Añade el tercer icono
                                SizedBox(
                                    width:
                                        8.0), // Espacio horizontal entre el icono y el texto
                                Text(
                                  'Contraseña:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Establece el color del texto
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index]['contraseña']}',
                              style: const TextStyle(
                                  color: Colors
                                      .white), // Establece el color del texto
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        await Navigator.pushNamed(context, '/editusers', arguments: {
                          'nombre': snapshot.data?[index]['nombre'],
                          'correo': snapshot.data?[index]['correo'],
                          'contraseña': snapshot.data?[index]['contraseña'],
                          'oid': snapshot.data?[index]['oid'],
                        });
                        setState(() {});
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        onPressed: () async {
          await Navigator.pushNamed(context, '/addusers');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



