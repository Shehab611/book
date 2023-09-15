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

}
