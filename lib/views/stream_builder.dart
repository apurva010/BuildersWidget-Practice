import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Future Builder Show",
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const StreamBuilderShow(),
              ),
            ),
            child: const Text('Stream Builder'),
          ),
        ),
      ),
    );
  }
}

class StreamBuilderShow extends StatelessWidget {
  const StreamBuilderShow({Key? key}) : super(key: key);

  Stream<int> getData() async* {
    await Future<void>.delayed(const Duration(seconds: 2));

    for (int i = 1; i <= 2; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Future Builder Show",
          ),
        ),
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "ERROR",
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data.toString();
                return Center(
                  child: Text("DATA : $data"),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          stream: getData(),
        ),
      ),
    );
  }
}
