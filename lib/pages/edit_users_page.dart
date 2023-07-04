import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditUsersPage extends StatefulWidget {
  const EditUsersPage({super.key});

  @override
  State<EditUsersPage> createState() => _EditUsersPageState();
}

class _EditUsersPageState extends State<EditUsersPage> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nombreController.text = arguments['nombre'];
    correoController.text = arguments['correo'];
    contrasenaController.text = arguments['contraseña'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Usuario'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration:
                  const InputDecoration(hintText: 'Escribe un nombre'),
            ),
            TextField(
              controller: correoController,
              decoration:
                  const InputDecoration(hintText: 'Escribe el correo electronico'),
            ),
            TextField(
              controller: contrasenaController,
              decoration:
                  const InputDecoration(hintText: 'Escribe la contraseña'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateUsers(arguments['oid'], nombreController.text,
                          correoController.text, contrasenaController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                ),
                child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}