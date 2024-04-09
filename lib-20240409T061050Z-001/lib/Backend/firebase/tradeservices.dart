import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Create
  Future<void> createProduct(Map<String, dynamic> data) async {
    try {
      await _firestore.collection('Imports').add(data);
    } catch (e) {
      print("Error creating product: $e");
    }
  }

  // Read
  Stream<QuerySnapshot> getProducts() {
    return _firestore.collection('Imports').snapshots();
  }

  // Update
  Future<void> updateProduct(String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('Imports').doc(id).update(data);
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  // Delete
  Future<void> deleteProduct(String id) async {
    try {
      await _firestore.collection('Imports').doc(id).delete();
    } catch (e) {
      print("Error deleting product: $e");
    }
  }
}

class FirebaseService_Suppliers {
  final CollectionReference importsRef =
      FirebaseFirestore.instance.collection('Imports');
  // Create
  Future<void> createProduct(Map<String, dynamic> data, String uid) async {
    try {
      await importsRef.doc('suppliers').collection(uid).add(data);
    } catch (e) {
      print("Error creating product: $e");
    }
  }

  // Read
  Stream<QuerySnapshot> getProducts(String uid) {
    return importsRef.doc('suppliers').collection(uid).snapshots();
  }

  // Update
  Future<void> updateProduct(
      String id, Map<String, dynamic> data, String uid) async {
    try {
      await importsRef.doc('suppliers').collection(uid).doc(id).update(data);
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  // Delete
  Future<void> deleteProduct(String id, String uid) async {
    try {
      await importsRef.doc('suppliers').collection(uid).doc(id).delete();
    } catch (e) {
      print("Error deleting product: $e");
    }
  }
}

class FirebaseService_Manufactures {
  final CollectionReference importsRef =
      FirebaseFirestore.instance.collection('Imports');
  // Create
  Future<void> createProduct(Map<String, dynamic> data, String uid) async {
    try {
      await importsRef.doc('manufacture').collection(uid).add(data);
    } catch (e) {
      print("Error creating product: $e");
    }
  }

  // Read
  Stream<QuerySnapshot> getProducts(String uid) {
    return importsRef.doc('manufacture').collection(uid).snapshots();
  }

  // Update
  Future<void> updateProduct(
      String id, Map<String, dynamic> data, String uid) async {
    try {
      await importsRef.doc('manufacture').collection(uid).doc(id).update(data);
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  // Delete
  Future<void> deleteProduct(String id, String uid) async {
    try {
      await importsRef.doc('manufacture').collection(uid).doc(id).delete();
    } catch (e) {
      print("Error deleting product: $e");
    }
  }
}

class FirebaseService_Retailers {
  final CollectionReference importsRef =
      FirebaseFirestore.instance.collection('Imports');
  // Create
  Future<void> createProduct(Map<String, dynamic> data, String uid) async {
    try {
      await importsRef.doc('retailer').collection(uid).add(data);
    } catch (e) {
      print("Error creating product: $e");
    }
  }

  // Read
  Stream<QuerySnapshot> getProducts(String uid) {
    return importsRef.doc('retailer').collection(uid).snapshots();
  }

  // Update
  Future<void> updateProduct(
      String id, Map<String, dynamic> data, String uid) async {
    try {
      await importsRef.doc('retailer').collection(uid).doc(id).update(data);
    } catch (e) {
      print("Error updating product: $e");
    }
  }

  // Delete
  Future<void> deleteProduct(String id, String uid) async {
    try {
      await importsRef.doc('retailer').collection(uid).doc(id).delete();
    } catch (e) {
      print("Error deleting product: $e");
    }
  }
}
