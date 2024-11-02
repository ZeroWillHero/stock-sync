import 'package:get/get.dart';
import 'package:stock_sync/repository/authentication_repo.dart';

import '../../repository/userRepo.dart';

class GetUserController extends GetxController{
  static GetUserController get instance => Get.find();

  final _auth = Get.put(AuthenticationRepo());
  final _user = Get.put(UserRepo());
  // user CRUD operations
getUser(){
  final email = _auth.fireBaseUser.value?.email;
  if (email != null){
    return _user.getUserDetails(email);
  }else {
    return null;
  }
}
}