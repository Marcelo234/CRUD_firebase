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

Future<void> addProduct(String name, String descripcion, String cantidad) async {
  await db.collection('product').add({'name': name, 'descripcion': descripcion, 'cantidad': cantidad});
}

Future<void> updateProduct(String uid, String newName, String newDescripcion, String newCantidad) async {
  await db.collection('product').doc(uid).set({'name':newName, 'descripcion':newDescripcion, 'cantidad':newCantidad});
}

Future<void> deleteProduct(String uid) async {
  await db.collection('product').doc(uid).delete();
}

