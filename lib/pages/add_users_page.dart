import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddUsersPage extends StatefulWidget {
  const AddUsersPage({super.key});

  @override
  State<AddUsersPage> createState() => _AddUsersPageState();
}

class _AddUsersPageState extends State<AddUsersPage> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController correoController = TextEditingController(text: "");
  TextEditingController contrasenaController = TextEditingController(text: "");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Usuario'),
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
                  const InputDecoration(hintText: 'Escribe un correo'),
            ),
            TextField(
              controller: contrasenaController,
              decoration:
                  const InputDecoration(hintText: 'Escribe una comtraseña'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  await addUsers(nombreController.text, correoController.text, contrasenaController.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                ),
                child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}