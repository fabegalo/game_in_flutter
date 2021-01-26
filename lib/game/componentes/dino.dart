import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:game_app_flutter/game/componentes/walkingBox.dart';
import '../PrimeiroGame.dart';

class Dino extends WalkingBox {
  double get speed => game.tileSize * 5;

  Dino(PrimeiroGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('dino.png'));
    flyingSprite.add(Sprite('dino.png'));
    deadSprite = Sprite('dino.png');
  }
}
