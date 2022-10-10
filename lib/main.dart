import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myntra/provider/sorting.dart';
import 'package:myntra/sample.dart';
import 'package:myntra/screens/filter.dart';
import 'package:myntra/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

Future<void> main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Sort(),child: MaterialApp(home: HomeScreen(),debugShowCheckedModeBanner: false,),);
  }
}

