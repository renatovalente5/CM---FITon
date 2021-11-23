import 'package:postos_locais/controllers/auth_controller.dart';
import 'package:postos_locais/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: <Widget>[
          Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/black/12.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    kThirdColor,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              height: MediaQuery.of(context).size.height * 0.55,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    SizedBox(height: 30),
                                    RichText(
                                      text: TextSpan(
                                        text: 'FIT\t',
                                        style: TextStyle(
                                            fontFamily: "Bebas",
                                            fontSize: 30,
                                            letterSpacing: 5),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'on',
                                            style:
                                                TextStyle(color: kFirstColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sign In",
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Train and live the new experience of \nexercising"
                                            " at home",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Color(0xFF707070), fontSize: 18),
                              ),
                              TextFormField(
                                controller: controller.email,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF707070)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF707070)),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Ivalid Email!';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Color(0xFF707070), fontSize: 18),
                              ),
                              TextFormField(
                                controller: controller.password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF707070)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF707070)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Invalid password!';
                                  } else if (value.length < 6) {
                                    return 'Password must have at least 6 characters!';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              /*Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () => Get.toNamed(Routes.FORGET_PASSWORD),
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),*/
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    TextButton(
                                      onPressed:
                                          () /*{
                              if(controller.formKey.currentState.validate()) {
                                if(controller.isLoged.value) {
                                  controller.login();
                                } else {
                                  return null;
                                }
                              } 
                            }, */
                                              =>
                                              Get.offAllNamed(Routes.HOME),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kFirstColor,
                                        ),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextButton(
                                      onPressed: () {
                                        if (controller.formKey.currentState
                                            .validate()) {
                                          if (controller.isLoged.value) {
                                            controller.login();
                                          }
                                        }
                                      },
                                      //=> Get.toNamed(Routes.REGISTER),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kThirdColor,
                                          border: Border.all(
                                              width: 1, color: kFirstColor),
                                        ),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 27),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
