import 'package:flutter/material.dart';

class BuilderWidget extends StatelessWidget {
  const BuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text('Why Builder Require'),
      ),

      // detect gesture
      body: Center(
        child: Builder(
          //If used without Builder It will give error because it use same context as scaffold and scaffold not created yet
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).showBodyScrim(true, 0.1);
            },

            // box styling
            child: Container(
              margin: const EdgeInsets.all(18),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'CLICK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
