// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class Secound extends StatefulWidget {
  const Secound({Key? key}) : super(key: key);

  @override
  State<Secound> createState() => _SecoundState();
}

class _SecoundState extends State<Secound> {
  List<Widget> allimages = [];

  @override
  void dispose() {
    allimages.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    allimages.clear();

    for (int i = 0; i < 31; i++) {
      allimages.add(
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Scaffold(
                      body: Center(
                        child: Image.asset('assets/imgs/files/${i}.jpg',
                            fit: BoxFit.cover),
                      ),
                    );
                  }));
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Image.asset(
                      'assets/imgs/files/${i}.jpg',
                      fit: BoxFit.cover,
                    )),
              )),
        ),
      );
    }

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
              'Álbum de Fotos',
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
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 130,
                child: GridView.count(
                    crossAxisCount: 2, mainAxisSpacing: 0, children: allimages),
              ),
              const SizedBox(height: 200),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(height: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
