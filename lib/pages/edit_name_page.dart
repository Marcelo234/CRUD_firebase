import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController cantidadController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    descripcionController.text = arguments['descripcion'];
    cantidadController.text = arguments['cantidad'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Escribe la modificacion'),
            ),
            TextField(
              controller: descripcionController,
              decoration:
                  const InputDecoration(hintText: 'Escribe la descripción'),
            ),
            TextField(
              controller: cantidadController,
              decoration:
                  const InputDecoration(hintText: 'Escribe la cantidad'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateProduct(arguments['uid'], nameController.text, descripcionController.text, cantidadController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}
