// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class Vermais extends StatefulWidget {
  const Vermais({Key? key}) : super(key: key);

  @override
  State<Vermais> createState() => _VermaisState();
}

class _VermaisState extends State<Vermais> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: Colors.black12,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Nosso Amor',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            scrolledUnderElevation: 0,
            elevation: 0,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFF363636), width: 4))),
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))
            ]),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: const [
               Text(
                'Emily, espero que tenha gostado que viu e está vendo, não sou o melhor programador do mundo, bem como não sou tão bom em me expressar, um dia que sabe eu lhe conto todas as ideias que tive para realizar isso. Enfim, quero dizer que sou grato por ter você em minha vida, acordar ao seu lado tem se tornado uma necessidade, me sinto completo ao seu lado, sinto que devo e vou te fazer a mulher mais feliz deste mundo, vamos andar de moto, fazer viagens, comer besteira e muitas outras coisas juntos ainda, não só nesta vida, mas como nas próximas, porque um amor como o nosso, é de outro mundo. Eu te amo e feliz aniversário.',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
              ),
              SizedBox(height: 20,),
              Text(
                'Com amor, Gustavo.',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 22, fontWeight: FontWeight.bold,),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
