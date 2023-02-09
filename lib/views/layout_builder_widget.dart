import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Layout Builder",
          ),
        ),
        body: SizedBox(
          width: 250,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    "$index",
                  ),
                  leading: const Icon(
                    Icons.person,
                  ),
                  trailing: const Icon(
                    Icons.add,
                  ),
                ),
                itemCount: 200,
              );
            },
          ),
        ),
      ),
    );
  }
}
