import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProduct() async {
  List product = [];
  CollectionReference collectionReferenceProduct = db.collection('product');
  QuerySnapshot queryProduct = await collectionReferenceProduct.get();
  queryProduct.docs.forEach((documento) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      'name': data['name'],
      'uid': documento.id,
    };
    product.add(person);
   });
  return product;
}

Future<void> addProduct(String name) async {
  await db.collection('product').add({'name': name});
}

Future<void> updateProduct(String uid, String newName) async {
  await db.collection('product').doc(uid).set({'name':newName});
}

Future<void> deleteProduct(String uid) async {
  await db.collection('product').doc(uid).delete();
}