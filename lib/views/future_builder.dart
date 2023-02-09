import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Future Builder",
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FutureBuilderShow(),
              ),
            ),
            child: const Text('Demonstrate FutureBuilder'),
          ),
        ),
      ),
    );
  }
}

class FutureBuilderShow extends StatelessWidget {
  const FutureBuilderShow({Key? key}) : super(key: key);

  Future<String> getData() {
    return Future.delayed(const Duration(seconds: 5), () {
      return "I am data";
      // throw Exception("Custom Error");
    });
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
        body: FutureBuilder(
          initialData: "initial data",
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error Occurred"),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data.toString();
                return Center(
                  child: Text(
                    "DATA $data",
                  ),
                );
              }
            }
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: LinearProgressIndicator(
                  minHeight: 5,
                ),
              ),
            );
          },
          future: getData(),
        ),
      ),
    );
  }
}
