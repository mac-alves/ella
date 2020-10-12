import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'start_controller.g.dart';

@Injectable()
class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store implements Disposable {
  final pageController = PageController();

  @override
  void dispose(){
    pageController.dispose();
  }
}
