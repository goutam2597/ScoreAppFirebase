import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PortugalVsGermany extends StatelessWidget {
  const PortugalVsGermany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Portugal Vs Germany'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('football')
            .doc('portugal_vs_germany')
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          if (snapshot.hasData) {
            final score = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 160,
                child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        score.get('match_name'),
                        style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black54),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            score.get('score_team_a').toString(),
                            style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(':',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                          ),
                          Text(
                            score.get('score_team_b').toString(),
                            style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Time:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text(score.get('time'),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Total Time:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text(score.get('total_time'),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
