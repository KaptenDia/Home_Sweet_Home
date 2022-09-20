import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetName extends StatelessWidget {
  final String documentId;
  const GetName({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('First Name: ${data['name']}');
        }
        return Text('loading');
      }),
    );
  }
}
