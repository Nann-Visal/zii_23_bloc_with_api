import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zii_23_bloc_with_api/bloc/bloc/post_bloc.dart';
import 'package:zii_23_bloc_with_api/services/post_services.dart';

import 'screens/home.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Bloc + API',
      theme:ThemeData(primarySwatch: Colors.yellow),
      home: BlocProvider<PostBloc>( //specifice type of bloc
        create: (context)=>PostBloc(postRepoSitory: PostService())..add(GetPostEvent()), //assign even of bloc
        child: HomeScreen(), //ui response bloc
      ),
    );
  }
}