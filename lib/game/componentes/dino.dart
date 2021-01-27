import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:game_app_flutter/game/componentes/walkingBox.dart';
import '../PrimeiroGame.dart';
import 'package:flame/flame.dart';

class Dino extends WalkingBox {
  Dino(PrimeiroGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprite = List<Sprite>();

    // Flame.images.loadAll(["sprite.png"]).then((image) => {
    //   flyingSprite.add(Sprite('dino.png'));
    //   flyingSprite.add(Sprite('dino.png'));
    //   image[0]
    // });

    flyingSprite.add(Sprite('dino1.png'));
    flyingSprite.add(Sprite('dino2.png'));
    deadSprite = Sprite('dino.png');
  }
}
