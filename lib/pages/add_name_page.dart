import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController cantidadController = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Producto'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Escribe un producto'),
            ),
            TextField(
              controller: descripcionController,
              decoration:
                  const InputDecoration(hintText: 'Escribe una descripción'),
            ),
            TextField(
              controller: cantidadController,
              decoration:
                  const InputDecoration(hintText: 'Escribe la cantidad'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  await addProduct(nameController.text, descripcionController.text, cantidadController.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
