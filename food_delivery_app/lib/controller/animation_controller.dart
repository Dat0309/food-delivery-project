import 'package:food_delivery_app/enums/animation_state.dart';
import 'package:get/get.dart';

class AnimController extends GetxController {
  AnimController();
  AnimationState animationState = AnimationState.normal;

  void changeAnimationState(AnimationState state) {
    animationState = state;
    update();
  }
}
