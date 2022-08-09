import 'package:food_delivery_app/service/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  bool isLoadding = false;
}
