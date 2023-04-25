import 'package:flutter/material.dart';

class MyBottomModalSheet extends StatefulWidget {
  const MyBottomModalSheet({Key? key}) : super(key: key);

  @override
  State<MyBottomModalSheet> createState() => _MyBottomModalSheetState();
}

class _MyBottomModalSheetState extends State<MyBottomModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Esse é o nosso Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat', 
              fontSize: 18)
              ),
              const SizedBox(height: 20,),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(220, 40)),
              backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/secound');
            },
            child: const Text('Fotos', style: TextStyle(
              fontFamily: 'Montserrat', 
              fontSize: 18)),
          ),

          ElevatedButton(
            
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(220, 40)),
              backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/third');
            },
            child: const Text('Memórias', style: TextStyle(
              fontFamily: 'Montserrat', 
              fontSize: 18)),
          ),

          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(220, 40)),
              backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/gifts');
            },
            child: const Text('Presentes', style: TextStyle(
              fontFamily: 'Montserrat', 
              fontSize: 18)),
          ),

          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(220, 40)),
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 105, 105, 105))),
            onPressed: null,
            child: const Text('Aguarde...', style: TextStyle(
              fontFamily: 'Montserrat', 
              fontSize: 18)),
          ),
        ],
      ),
    );
  }
}