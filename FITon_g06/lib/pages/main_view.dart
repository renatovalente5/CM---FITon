import 'package:camera/camera.dart';
import 'package:postos_locais/camera_screen.dart';
import 'package:postos_locais/main.dart';
import 'package:postos_locais/pages/list_friends.dart';
import 'package:postos_locais/pages/postos_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class MainView extends GetView<MainController> {
  //final cameras = availableCameras(); //Get list of available cameras
  //MainView({Key key}) : super(key: key);
  // final List<CameraDescription> cameras;
  // const MainView({Key key, this.cameras}) : super(key: key);
  //var cameras = availableCameras();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageCotroller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          TrainView(),
          App(),
          ListFriends(),
          CameraScreen(),
          ProfileView()
        ],
      ),
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: Colors.grey[200],
          child: MenuBottomNavBarWidget(
            currentIndex: value,
            items: controller.navigationItems,
            onTap: (tab) {
              controller.pageCotroller.animateToPage(
                tab,
                duration: controller.animationDuration,
                curve: Curves.ease,
              );
              updateFn(tab);
            },
          ),
        ),
      ),
    );
  }

  // src() async {
  //   /// Make sure you add this line here, so the plugin can access the native side
  //   WidgetsFlutterBinding.ensureInitialized();
  //   var cameras = await availableCameras(); //Get list of available cameras
  //   print(cameras);

  //   return cameras;
  // }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends Locations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        // primarySwatch: Colors.blue,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: kSecondColor, //use your hex code here
        // ),
      ),
      home: PostosPage(),
    );
  }
}
