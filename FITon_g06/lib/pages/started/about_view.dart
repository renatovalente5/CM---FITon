import 'package:postos_locais/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThirdColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/black/16.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: kThirdColor.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  RichText(
                    text: TextSpan(
                      text: 'FIT\t',
                      style: TextStyle(
                          fontFamily: "Bebas", fontSize: 40, letterSpacing: 5),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'on',
                          style: TextStyle(color: kFirstColor),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About You",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "We want to know more about you, follow the next \nsteps to complete the information",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ValueBuilder<int>(
                    initialValue: 0,
                    builder: (value, updateFn) => Row(
                      children: [
                        OptionWidget(
                          state: "I'm\nBeginner",
                          detail: "I have trained several times",
                          enable: value == 0 ? true : false,
                          onTap: () => updateFn(0),
                        ),
                        SizedBox(width: 20),
                        OptionWidget(
                          state: "I'm\nExpert",
                          detail: "I have trained more times",
                          enable: value == 1 ? true : false,
                          onTap: () => updateFn(1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Row(
      children: [
        TextButton(
          onPressed: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "Back",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          child: Container(
            height: 40,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kFirstColor,
            ),
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
