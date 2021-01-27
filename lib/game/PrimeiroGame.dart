import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:game_app_flutter/game/componentes/walkingBox.dart';
import 'componentes/fly.dart';
import 'componentes/background.dart';
import 'componentes/house-fly.dart';
import 'componentes/dino.dart';

import 'dart:math';

class PrimeiroGame extends BaseGame {
  double velocity = 2;
  Size screenSize;
  double tileSize;
  Background background;
  List<Fly> flies;
  List<WalkingBox> dinos;
  Random rnd;

  PrimeiroGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    dinos = List<WalkingBox>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    background = Background(this);
    dinos.add(Dino(this, 30, 620));
    spawnFly();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);

    //flies.add(HouseFly(this, x, y));
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render

    background.render(canvas);
    dinos.forEach((WalkingBox dinos) => dinos.render(canvas));
    flies.forEach((Fly fly) => fly.render(canvas));

    super.render(canvas);
  }

  @override
  void update(double t) {
    // TODO: implement update
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);

    dinos.forEach((WalkingBox dinos) => dinos.update(t));

    background.update(t);

    //print(velocity);

    if (velocity >= 10) {
      velocity = 10;
    }

    super.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    print(size);
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    print(d.kind);
    print('Bati na tela!');
    velocity++;

    dinos.forEach((WalkingBox dinos) {
      if (dinos.flyRect.contains(d.globalPosition)) {
        dinos.onTapDown();
      }
    });

    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}
