import 'package:cloud_firestore/cloud_firestore.dart';

abstract final class  DataHandling {
  static Future<bool> checkIfDocExist({
    required String collectionName,
    required String docName,
  }) async {
    var x = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .get();
    return x.exists;
  }

  static Future<List<Map<String, dynamic>>> getDataFromAllDocs({
    required String collectionName,
  }) async {
    List<Map<String, dynamic>> docsData = [];

    await FirebaseFirestore.instance
        .collection(collectionName)
        .get()
        .then((allDocs) {
      for (var doc in allDocs.docs) {
        docsData.add((doc.data()));
      }
    });
    return docsData;
  }

//the element in this returned list is a field from all docs
  static Future<List<dynamic>> getSpecificDataFromAllDocs({
    required String collectionName,
    required String fieldName,
  }) async {
    List<dynamic> docsData = [];

    await FirebaseFirestore.instance
        .collection(collectionName)
        .get()
        .then((allDocs) {
      for (var doc in allDocs.docs) {
        docsData.add(doc.get(fieldName));
      }
    });
    return docsData;
  }

//the data from selected document
  static Future<DocumentSnapshot<Map<String, dynamic>>> getDataFromDoc({
    required String collectionName,
    required String docName,
  }) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .get();
  }

//specific
//the data of the field in selected document
  static Future<dynamic> getSpecificDataFromDoc({
    required String collectionName,
    required String docName,
    required String fieldName,
  }) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .get()
        .then((value) {
      if (!value.exists) return 'Not Exist';
      return value.get(fieldName)!;
    });
  }

//the data from selected document in sub collection
  static Future<Map<String, dynamic>> getDataFromDocInSubCollection({
    required String collectionName,
    required String docName,
    required String subCollectionName,
    required String subDocName,
  }) async {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .doc(subDocName)
        .get()
        .then((value) {
      if (!value.exists) return {'error': 'Document Not Exists'};
      return value.data()!;
    });
  }

//the data of the field from selected document in sub collection
  static Future<dynamic> getSpecificDataFromDocInSubCollection({
    required String collectionName,
    required String docName,
    required String subCollectionName,
    required String subDocName,
    required String fieldName,
  }) async {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .doc(subDocName)
        .get()
        .then((value) {
      if (!value.exists) return 'Document Not Exists';
      return value.get(fieldName)!;
    });
  }

//the element in this returned list is the data in the doc of sub collection
  static Future<List<Map<String, dynamic>>> getDataFromAllDocsInSubCollection({
    required String collectionName,
    required String docName,
    required String subCollectionName,
  }) async {
    List<Map<String, dynamic>> docsData = [];

    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .get()
        .then((allDocs) {
      for (var doc in allDocs.docs) {
        docsData.add((doc.data()));
      }
    });
    return docsData;
  }

  static Future<List<dynamic>> getSpecificDataFromAllDocsInSubCollection({
    required String collectionName,
    required String docName,
    required String subCollectionName,
    required String fieldName,
  }) async {
    List<dynamic> docsData = [];

    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .get()
        .then((allDocs) {
      for (var doc in allDocs.docs) {
        docsData.add(doc.get(fieldName));
      }
    });
    return docsData;
  }

  List<Map<String, dynamic>> getStreamOfDataChat({
    required String collectionName,
    required String docName,
    required String subCollectionName,
    required String subDocName,
    required String subSubCollectionName,
  }) {
    List<Map<String, dynamic>> data = [];

    return data;
  }

  static Future<void> addDataToDocument(
      {required String collectionName,
      required String docName,
      required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .update(data)
        .catchError((error) async {
      if (error is FirebaseException) {
        await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(docName)
            .set(data);
      }
    });
  }

  static Future<void> addDataToDocInSubCollection(
      {required String collectionName,
      required String docName,
      required String subCollectionName,
      String? subDocName,
      required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .doc(subDocName)
        .update(data)
        .catchError((error) async {
      if (error is FirebaseException) {
        await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(docName)
            .collection(subCollectionName)
            .doc(subDocName)
            .set(data);
      }
    });
  }

  static Future<void> removeDocInSubCollection({
    required String collectionName,
    required String docName,
    required String subCollectionName,
    required String subDocName,
  }) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .doc(subDocName)
        .delete();
  }

  static Future<void> addDataToDocInSubSubCollection(
      {required String collectionName,
      required String docName,
      required String subCollectionName,
      required String subDocName,
      required String subSubCollectionName,
      required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docName)
        .collection(subCollectionName)
        .doc(subDocName)
        .collection(subSubCollectionName)
        .add(data);
  }
}
