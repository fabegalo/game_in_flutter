import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:game_app_flutter/game/PrimeiroGame.dart';
import '../PrimeiroGame.dart';

class Background {
  final PrimeiroGame game;
  Sprite bgSprite;
  Rect backRect;

  Background(this.game) {
    bgSprite = Sprite('background.jpg');
    backRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, backRect);
  }

  void update(double t) {}
}
