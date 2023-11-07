import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> addComplaint(String userId, DateTime date, String description, String shortDesc/* , List<String> agressions */) async {
    await _firestore.collection('complaints').add({
      'userId': userId,
      'date': date,
      'description': description,
      'shortDesc': shortDesc
      /* 'aggressions': agressions, */
    });
  }
}