import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_intro/match_list/argentina_vs_brazil.dart';
import 'package:firebase_intro/match_list/portugal_vs_germany.dart';
import 'package:firebase_intro/match_list/spain_vs_italy.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SpainVsItaly()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Spain vs Italy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  Icon(Icons.arrow_forward,color: Colors.black,),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ArgentinaVsBrazil()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Argentina Vs Brazil',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  Icon(Icons.arrow_forward,color: Colors.black,),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PortugalVsGermany()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Portugal Vs Germany',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                  Icon(Icons.arrow_forward,color: Colors.black,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
