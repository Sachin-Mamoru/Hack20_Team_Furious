import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'insta_bodyPart2.dart';
// import 'CategoryCard.dart';

class AddOrderMain extends StatelessWidget {
  final db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('Project').orderBy('date', descending: true)
            // .document('1')
            // .collection('SubCategories')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var doc = snapshot.data.documents;

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                // return ChatMessage(message);
                return new CategeoryCard(doc[index], doc[index].documentID);
              },
            );
          } else {
            return new LinearProgressIndicator();
          }
        });
  }
}
