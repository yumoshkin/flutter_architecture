import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:business_package/business_package.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MainBlocState>(
      stream: context.read<MainBloc>().state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;

          return state!.map<Widget>(
            loading: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Flutter architecture'),
                centerTitle: true,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            loaded: (state) => Scaffold(
              appBar: AppBar(
                title: const Text('Flutter architecture'),
                centerTitle: true,
              ),
              body: Center(
                child: Text(
                  state.userData.name,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => context
                    .read<MainBloc>()
                    .add(MainBlocEvent.setUser(userId: state.userData.id + 1)),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
