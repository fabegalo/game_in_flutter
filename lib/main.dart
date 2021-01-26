import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'game/PrimeiroGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  PrimeiroGame game = PrimeiroGame();
  runApp(ModalGame(game));

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}

class ModalGame extends StatefulWidget {
  final PrimeiroGame game;
  _ModalGameState createState() => _ModalGameState();
}

class _ModalGameState extends State<ModalGame> {
  Widget build(BuildContext context) {
    return 
  }
}
