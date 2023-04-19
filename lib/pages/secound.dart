import 'package:flutter/material.dart';

class Secound extends StatefulWidget {
  const Secound({Key? key}) : super(key: key);

  @override
  State<Secound> createState() => _SecoundState();
}

class _SecoundState extends State<Secound> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Segunda Pagina'),
    );
  }
}