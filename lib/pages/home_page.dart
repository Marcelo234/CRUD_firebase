import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Productos'),
        backgroundColor: const Color.fromARGB(255, 77, 74, 74),
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
                color: const Color.fromARGB(255, 77, 74, 74),
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuracion'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getProduct(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deleteProduct(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;

                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  '¿Estas seguro de eliminar ${snapshot.data?[index]['name']}?'),
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
                    key: Key(snapshot.data?[index]['uid']),
                    child: ListTile(
                      title: Container(
                        color: const Color.fromARGB(255, 77, 74, 74), // Establece el color de fondo gris
                        padding: const EdgeInsets.all(
                            16.0), // Añade un padding al Container si es necesario
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.category,
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
                              '${snapshot.data?[index]['name']}',
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
                                  'Descripción:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Establece el color del texto
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index]['descripcion']}',
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
                                  'Cantidad:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .white, // Establece el color del texto
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${snapshot.data?[index]['cantidad']}',
                              style: const TextStyle(
                                  color: Colors
                                      .white), // Establece el color del texto
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        await Navigator.pushNamed(context, '/edit', arguments: {
                          'name': snapshot.data?[index]['name'],
                          'descripcion': snapshot.data?[index]['descripcion'],
                          'cantidad': snapshot.data?[index]['cantidad'],
                          'uid': snapshot.data?[index]['uid'],
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
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
