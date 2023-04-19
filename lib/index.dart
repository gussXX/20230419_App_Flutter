// ignore_for_file: avoid_print, no_logic_in_create_state, avoid_returning_null_for_void

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:emy/Store/store.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() {
    print('ESTADO CRIADO');
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  late StreamSubscription _streamSubscription;
  final StreamController<int> _controller = StreamController<int>();

  @override
  void initState() {
    print('ESTADO INICIADO');
    super.initState();
    _streamSubscription = _controller.stream.listen((data) {
      // Atualiza a interface gráfica com os novos dados do stream
      print('Data from stream: $data');
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    // Cancela a assinatura do stream
    super.dispose();
  }

  final Counter         appStore    = Counter();
  final Variables       variables   = Variables();
  final PageController  controller  = PageController();

  @override
  Widget build(BuildContext context) {
    List<Widget> containers = [];

    for (int i = 0; i < 5; i++) {
      containers.add(Container(
        color: Colors.blue,
        height: 50,
        width: 50,
      ));
    }

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      home: Scaffold(
        floatingActionButton:
            FloatingActionButton(elevation: 0, onPressed: appStore.increment),
        appBar: AppBar(title: const Text('App in Flutter'), actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/secound');
              },
              icon: const Icon(Icons.home))
        ]),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                  builder: (_) => Text(
                        'Count : ${appStore.counter}',
                        style: const TextStyle(
                          fontSize: 20,
                          backgroundColor: null,
                        ),
                      )),
              SizedBox(
                width: 200,
                height: 200,
                child: Observer(builder: (_) {
                  return PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    children: [
                      Container(color: Colors.blue, height: 50, width: 50),
                      Container(color: Colors.red, height: 50, width: 50),
                      Container(color: Colors.green, height: 50, width: 50),
                    ],
                    onPageChanged: (int index) {
                        variables.indexList = index;
                        print('A pagina atual é ${variables.indexList}');
                        variables.change;
                    }
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
