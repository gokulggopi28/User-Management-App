import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../user/controllers/user_controller.dart';

class UserFormController extends GetxController {
  final User? initialUser;
  
  UserFormController({this.initialUser});

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: initialUser?.name ?? '');
    emailController = TextEditingController(text: initialUser?.email ?? '');
    phoneController = TextEditingController(text: initialUser?.phone ?? '');
  }

  void saveUser() {
    final userController = Get.find<UserController>();
    
    final user = User(
      id: initialUser?.id,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );

    if (initialUser == null) {
      userController.createUser(user);
    } else {
      userController.updateUser(user);
    }
    
    Get.back(); 
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}