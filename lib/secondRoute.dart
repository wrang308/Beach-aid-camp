import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondRoute extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['hej']??'error',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['was'].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ],
      ),
      onTap: () {
        try {
          Firestore.instance.runTransaction((transaction) async {
            DocumentSnapshot freshSnap =
            await transaction.get(document.reference);
            print('freshsnap = ' + freshSnap['was'].toString());
            await transaction.update(freshSnap.reference, {
              'was': freshSnap['was'] + 1,
            });
          });
        } catch(err){
          print(err.toString());
        }

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('test').document('test').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            print(snapshot);
            print('*Hejsan!*');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: 1, //snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data),
            );
          }),
    );
  }
}