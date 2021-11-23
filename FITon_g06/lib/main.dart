import 'package:camera/camera.dart';
import 'package:postos_locais/config.dart';
import 'package:postos_locais/camera_screen.dart';
import 'package:postos_locais/repositories/postos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'core.dart';
import 'package:geolocator/geolocator.dart';

List<CameraDescription> cameras = [];

void main() async {
  initConfigs();

  /// Make sure you add this line here, so the plugin can access the native side
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  cameras = await availableCameras(); //Get list of available cameras

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));

  //runApp(MyApp());
  runApp(
    ChangeNotifierProvider<PostosRepository>(
      create: (_) => PostosRepository(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FITon Workout',
      //home: CameraScreen(cameras: cameras),
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.blue,

        hintColor: Colors.white,
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 230),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put<MainController>(MainController());
        Get.put<TrainController>(TrainController());
        Get.put<ProfileController>(ProfileController());
      }),
    );
  }
}

/////////////////////////////////////

// class Camera extends StatelessWidget {
//   final List<CameraDescription> cameras;
//   const Camera({Key key, this.cameras}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Camera App',
//       home: CameraScreen(cameras: cameras),
//     );
//   }
// }

///////////////////////////////////// Coordenadas
class Pontos extends StatelessWidget {
  const Pontos({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Local'),
      ),
      body: ChangeNotifierProvider<PostosController>(
        create: (context) => PostosController(),
        child: Builder(builder: (context) {
          final local = context.watch<PostosController>();

          String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
              : local.erro;

          return Center(child: Text(mensagem));
        }),
      ),
    );
  }
}

class PostosController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';

  PostosController() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Ative a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
        desiredAccuracy: LocationAccuracy.lowest);
  }
}
