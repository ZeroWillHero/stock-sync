import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:stock_sync/controllers/userControllers/registerController.dart";

class LogFields extends StatefulWidget {
  const LogFields({super.key});

  @override
  State<LogFields> createState() => _LogFieldsState();
}

class _LogFieldsState extends State<LogFields> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Registercontroller());
    return Column(
      children: [
        // text field to add Email field
        TextField(
          controller: controller.email,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 50),
        // text field to add Password field
        TextField(
          controller : controller.password,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            prefixIcon: const Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
