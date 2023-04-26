// ignore_for_file: avoid_print, no_logic_in_create_state, avoid_returning_null_for_void, unnecessary_brace_in_string_interps, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:everthing/Store/store.dart';

import 'package:video_player/video_player.dart';

import 'package:intl/intl.dart';

import 'package:everthing/widgets/bottomsheet.dart';

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

  late VideoPlayerController _videoplayercontroller;

  List<Widget> containers = [];
  List<Widget> slides = [];
  List<Widget> videos = [];

  @override
  void initState() {
    super.initState();
    print('ESTADO INICIADO');
    _streamSubscription = _controller.stream.listen((data) {
      // Atualiza a interface gráfica com os novos dados do stream
      print('Data from stream: $data');
    });
  }

  @override
  void dispose() {
    containers.clear();
    slides.clear();

    _videoplayercontroller.dispose();
    _streamSubscription.cancel();
    // Cancela a assinatura do stream
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Counter appStore = Counter();
    final Variables variables = Variables();
    final PageController controller = PageController();

    // Obter data e hora atuais
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy - HH:mm:ss').format(now);
    bool _isHighISO = true;

    containers.clear();
    slides.clear();
    videos.clear();

    for (int i = 0; i < 5; i++) {
      containers.add(Observer(
        builder: (_) => Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == variables.indexList ? Colors.black : Colors.grey)),
      ));
    }

    for (int i = 0; i < 5; i++) {
      slides.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Scaffold(
                      body: Center(
                        child: Image.asset('assets/imgs/carrousel/0${i}.jpg',
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
                      border: Border.all(color: Colors.black, width: 4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/imgs/carrousel/0${i}.jpg',
                      fit: BoxFit.cover,
                    )),
              )),
        ),
      );
    }

    for (int i = 0; i < 5; i++) {
      videos.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFACACAC).withAlpha(128),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const SizedBox(
                        height: 190,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.matrix(<double>[
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/imgs/00.jpg'),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'data',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
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
        backgroundColor: const Color(0xFFFFFFFF),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            elevation: 0,
            onPressed: () {
              appStore.increment;
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return const MyBottomModalSheet();
                  });
            },
            child: const Icon(
              Icons.heart_broken_outlined,
            )),
        appBar: AppBar(
            title: const Text(
              'Everything',
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
              // IconButton(
              //     onPressed: () {
              //       //Navigator.of(context).pushNamed('/secound');
              //     },
              //     icon: const Icon(
              //       Icons.add,
              //       color: Colors.black,
              //     ))
            ]),
        body: SingleChildScrollView(
          controller: controller,
          physics: const ScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Observer(
                //     builder: (_) => Text(
                //           'Count : ${appStore.counter}',
                //           style: const TextStyle(
                //             fontFamily: 'Montserrat',
                //             fontSize: 20,
                //             backgroundColor: null,
                //           ),
                //         )),
                SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: PageView(
                      pageSnapping: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      children: slides,
                      onPageChanged: (int index) {
                        variables.indexList = index;
                      }),
                ),
                SizedBox(
                    width: 60,
                    height: 20,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: containers)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'para Emily...',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "De uma ideia meio boba a um projeto que se deixasse eu passaria horas mexendo nele. Em algumas linhas de código (cerca de 1859) tentei construir algo que pudesse expressar uma fração do quanto eu te amo e quem sabe pode eternizar cada momento nosso nessas linhas de código...",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.fade,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xff000000)),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(120, 40))),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/vermais');
                                  },
                                  child: const Text('Ver mais'),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Stack(children: [
                    SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image.asset(
                          'assets/imgs/bg3.png',
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: PageView(
                          pageSnapping: false,
                          controller: PageController(viewportFraction: 0.5),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFACACAC)
                                          .withAlpha(128),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: const SizedBox(
                                            height: 190,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/imgs/she/00.jpg'),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'É linda',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Montserrat',
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFACACAC)
                                          .withAlpha(128),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: const SizedBox(
                                            height: 190,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/imgs/she/01.jpg'),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Tem 1,51m',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Montserrat',
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFACACAC)
                                          .withAlpha(128),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: const SizedBox(
                                            height: 190,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/imgs/she/02.jpg'),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Ama uma empadinha',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Montserrat',
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFACACAC)
                                          .withAlpha(128),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: const SizedBox(
                                            height: 190,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/imgs/she/03.jpg'),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Curte um nargas',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Montserrat',
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFACACAC)
                                          .withAlpha(128),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: const SizedBox(
                                            height: 190,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/imgs/she/04.jpg'),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'dorme fofo...',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Montserrat',
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                                                      
                          ]),
                    )
                  ]),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 0),
                          child: Divider(height: 2, color: Colors.grey),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey[100],
                        //       borderRadius: BorderRadius.circular(90)),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       IconButton(
                        //           onPressed: () {
                        //             null;
                        //           },
                        //           icon: const Icon(Icons.more_horiz)),
                        //       const Text(
                        //         'Precione o Botão',
                        //         style: TextStyle(
                        //           fontFamily: 'Montserrat',
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       GestureDetector(
                        //         onTap: () => variables.chanceswitchvalue(),
                        //         child: Observer(
                        //           builder: (_) => Switch(
                        //             value: variables.switchvalue,
                        //             onChanged: (bool newValue) {
                        //               variables.chanceswitchvalue();
                        //             },
                        //             activeTrackColor: Colors.black,
                        //             activeColor:
                        //                 const Color.fromARGB(255, 95, 90, 90),
                        //             inactiveThumbColor: Colors.white,
                        //             inactiveTrackColor: Colors.grey,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Observer(
                        //   builder: (_) => AnimatedOpacity(
                        //     opacity: variables.switchvalue == true ? 1 : 0,
                        //     duration: const Duration(seconds: 1),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         const SizedBox(height: 10),
                        //         Container(
                        //             width: double.infinity,
                        //             height: 100,
                        //             decoration: BoxDecoration(
                        //                 color: Colors.grey[300],
                        //                 borderRadius: const BorderRadius.all(
                        //                     Radius.circular(10))),
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.center,
                        //               children: const [
                        //                 Text(
                        //                   'Texto',
                        //                   style: TextStyle(
                        //                       fontFamily: 'Montserrat'),
                        //                 ),
                        //               ],
                        //             )),
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Feliz Aniversário!',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "O tempo é ralativo e espero passar cada minuto dessa incerteza que é o mundo, com minha maior certeza; você. Eu te amo e sempre vou te amar.",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.fade,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(Icons.favorite),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(height: 2, color: Colors.grey),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Desenvolvido por Gustavo',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold)),
                        Text('feito com muito código e amor.',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal)),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
