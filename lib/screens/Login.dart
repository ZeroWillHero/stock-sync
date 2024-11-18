import "package:get/get.dart";
import "package:stock_sync/components/LogFields.dart";
import "package:flutter/material.dart";
import "package:stock_sync/constants/Constants.dart";
import "package:stock_sync/controllers/userControllers/registerController.dart";
import "package:stock_sync/screens/Register.dart";

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(Registercontroller());
    return Scaffold(
        body: Center(
            child: Container(
      width: 350,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // add a logo image
              // Image.asset("assets/logo.png"),
              // const SizedBox(height: ),
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 18),

              // text field to add Email field
              LogFields(),

              const SizedBox(height: 20),

              // Remember me
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {},
                      checkColor: secondaryColor,
                      fillColor: MaterialStateProperty.all(quaternaryColor),
                    ),
                    const Text("Remember me"),
                  ],
                ),
              ),

              // button to login

              SizedBox(
                width: 160,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.login(
                        controller.email.text.trim(),
                        controller.password.text.trim(),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: secondaryColor,
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // link for create account
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => {Get.to(() => Register())},
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14,
                    color: quaternaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: quaternaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
