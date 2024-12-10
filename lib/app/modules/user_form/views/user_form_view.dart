import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_form_controller.dart';

class UserFormView extends GetView<UserFormController> {
  const UserFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.initialUser == null ? 'Create User' : 'Edit User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: controller.phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.saveUser,
              child: Text(controller.initialUser == null ? 'Create' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}