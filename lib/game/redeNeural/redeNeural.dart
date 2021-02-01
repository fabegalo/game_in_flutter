import 'dart:math';
import 'package:game_app_flutter/game/componentes/DinoBox.dart';

class RedeNeural {
  int distancia;
  int velocidade;
  DinoBox individuo; //8 genes -900 123 -090 -123 -1234 -1234 -3454 -0909

  RedeNeural(DinoBox dino) {
    this.individuo = dino;
  }

  void setDistancia(int distancia) {
    this.distancia = distancia;
  }

  void setVelocidade(int velocidade) {
    this.velocidade = velocidade;
  }

  bool redeNeural() {
    double finalSinapse = 0.0;

    List<double> arrSinapse = new List<double>();

    for (int i = 0; i < this.individuo.genes.length; i++) {
      arrSinapse.add(this.positron(i));
      i++;
    }

    //gambiarra
    for (int i = 0; i < arrSinapse.length; i++) {
      print(arrSinapse[i]);
      print(i);

      if (arrSinapse[i] >= 0.5) {
        finalSinapse++;
      }
    }

    if (finalSinapse >= 3) {
      return true;
    } else {
      return false;
    }
    //return finalSinapse >= 2 ?? true;
  }

  double positron(int i) {
    //bias
    //senoide 1/(1 + Math.exp(-x)) achata qqr numero e deixda ele entre 0 e 1
    double entrada1 =
        ((this.distancia * 1000) * this.individuo.genes[i]) / 1000000;
    double entrada2 =
        ((this.velocidade * 1000) * this.individuo.genes[++i]) / 1000000;
    double x = entrada1 + entrada2;
    return 1 / (1 + exp(-x));
  }
}
