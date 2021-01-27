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
  bool isJumping = false;
  int jumpCount = 0;

  WalkingBox(this.game);

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
      flyingSpriteIndex += game.velocity * t;
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
