import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zii_23_bloc_with_api/bloc/bloc/post_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostErrorState) {
            return const Center(
              child: Text('Erro!!'),
            );
          } else if (state is PostSuccessState) {
            return ListView.builder(
              itemCount: state.postData!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.postData[index].title),
                    subtitle: Text(state.postData[index].body),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
