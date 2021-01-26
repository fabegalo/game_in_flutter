import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import '../PrimeiroGame.dart';

class WalkingBox {
  final PrimeiroGame game;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  Rect flyRect;
  bool isDead = false;
  bool isOffScreen = false;
  Offset targetLocation;
  bool isJumping = false;
  int jumpCount = 0;

  double get speed => game.tileSize * 3;

  WalkingBox(this.game) {
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = 15 * (game.screenSize.width - (game.tileSize * 2.025));
    double y = 30 * (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) async {
    if (isDead) {
      // flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      // if (flyRect.top > game.screenSize.height) {
      //   isOffScreen = true;
      // }
    } else {
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }

      if (isJumping) {
        jumpCount++;

        if (jumpCount <= 20) {
          flyRect = flyRect.shift(new Offset(0, -6));
        } else if (jumpCount <= 40) {
          flyRect = flyRect.shift(new Offset(0, 6));
        } else {
          jumpCount = 0;
          isJumping = false;
        }
      }
    }
  }

  void jump() {
    print('Pulei!');
    isJumping = true;
  }

  void onTapDown() {
    jump();
    //isDead = true;
    //game.spawnFly();
  }
}
