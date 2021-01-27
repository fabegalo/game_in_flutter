import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'game/PrimeiroGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.setLandscape();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  PrimeiroGame game = PrimeiroGame();
  runApp(MyApp(game));

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}

class MyApp extends StatelessWidget {
  PrimeiroGame game;

  MyApp(this.game);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/SplashScreen": (context) => ModalGame(game),
      },
      title: 'App Materiais em Processo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ModalGame(game),
    );
  }
}

class ModalGame extends StatefulWidget {
  final PrimeiroGame game;

  ModalGame(this.game);

  _ModalGameState createState() => _ModalGameState(game);
}

class _ModalGameState extends State<ModalGame> {
  PrimeiroGame game;

  _ModalGameState(this.game);

  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Toma no cu!'),
    //   ),
    //   body: game.widget,
    //   floatingActionButton: FloatingActionButton(
    //     child: Text('Pau no cu!'),
    //     onPressed: () {
    //       print('Apertei o floting');
    //     },
    //   ),
    // );

    return game.widget;
  }
}
