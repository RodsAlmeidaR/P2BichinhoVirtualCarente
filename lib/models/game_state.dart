import 'package:flutter/material.dart';
import 'dart:async';


class GameState extends ChangeNotifier {
  double hunger = 1.0;
  double fun = 1.0;
  double sleep = 1.0;

  GameState() {
    _startTimers();
  }

  void _startTimers() {
    Timer.periodic(Duration(minutes: 2), (timer) {
      hunger = (hunger - 0.1).clamp(0.0, 1.0);
      notifyListeners();
    });

    Timer.periodic(Duration(minutes: 1), (timer) {
      fun = (fun - 0.25).clamp(0.0, 1.0);
      notifyListeners();
    });

    Timer.periodic(Duration(minutes: 5), (timer) {
      sleep = (sleep - 0.25).clamp(0.0, 1.0);
      notifyListeners();
    });
  }

  void feed() {
    hunger = (hunger + 0.25).clamp(0.0, 1.0);
    notifyListeners();
  }

  void play() {
    fun = (fun + 0.5).clamp(0.0, 1.0);
    notifyListeners();
  }

  void sleepIncrement() async {
    while (sleep < 1.0) {
      sleep = (sleep + 0.2).clamp(0.0, 1.0);
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void resetSleep() {
    sleep = 0.5;
    notifyListeners();
  }
}
