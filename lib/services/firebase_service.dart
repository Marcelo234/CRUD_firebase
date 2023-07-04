import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProduct() async {
  List product = [];
  CollectionReference collectionReferenceProduct = db.collection('product');
  QuerySnapshot queryProduct = await collectionReferenceProduct.get();
  for (var documento in queryProduct.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      'name': data['name'],
      'descripcion': data['descripcion'],
      'cantidad': data['cantidad'],
      'uid': documento.id,
    };
    product.add(person);
  }
  return product;
}

Future<void> addProduct(
    String name, String descripcion, String cantidad) async {
  await db
      .collection('product')
      .add({'name': name, 'descripcion': descripcion, 'cantidad': cantidad});
}

Future<void> updateProduct(String uid, String newName, String newDescripcion,
    String newCantidad) async {
  await db.collection('product').doc(uid).set({
    'name': newName,
    'descripcion': newDescripcion,
    'cantidad': newCantidad
  });
}

Future<void> deleteProduct(String uid) async {
  await db.collection('product').doc(uid).delete();
}

Future<List> getUsers() async {
  List users = [];
  CollectionReference collectionReferenceUsers = db.collection('users');
  QuerySnapshot queryUsers = await collectionReferenceUsers.get();
  for (var documento in queryUsers.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final persona = {
      'nombre': data['nombre'],
      'correo': data['correo'],
      'contraseña': data['contraseña'],
      'oid': documento.id,
    };
    users.add(persona);
  }
  return users;
}

Future<void> addUsers(String nombre, String correo, String contrasena) async {
  await db.collection('users').add({'nombre': nombre, 'correo': correo, 'contraseña': contrasena});
}

Future<void> updateUsers(String oid, String newNombre, String newCorreo, String newContrasena) async {
  await db.collection('users').doc(oid).set({'nombre': newNombre, 'correo': newCorreo, 'contraseña': newContrasena});
}

Future<void> deleteUsers(String oid) async {
  await db.collection('users').doc(oid).delete();
}
