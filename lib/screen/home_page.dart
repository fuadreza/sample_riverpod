import 'package:flutter/material.dart';
import 'package:sample_riverpod/screen/counter_page.dart';
import 'package:sample_riverpod/screen/counter_stream_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod App'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  Navigator.push(context, CounterPage.route());
                },
                child: const Text('Go to Counter Page'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
                onPressed: () {
                  Navigator.push(context, CounterStreamPage.route());
                },
                child: const Text('Go to Counter Stream Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
