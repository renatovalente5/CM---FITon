// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:postos_locais/repositories/postos_repository.dart';
// import 'package:provider/src/provider.dart';

// ///////////////////////////////////// MAP
// class MapView extends StatelessWidget {
//   const MapView({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Meu Local'),
//       ),
//       body: ChangeNotifierProvider<PostosController>(
//         create: (context) => PostosController(),
//         child: Builder(builder: (context) {
//           final local = context.watch<PostosController>();

//           String mensagem = local.erro == ''
//               ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
//               : local.erro;

//           return Center(child: Text(mensagem));
//         }),
//       ),
//     );
//   }
// }

// class PostosController extends ChangeNotifier {
//   double lat = 0.0;
//   double long = 0.0;
//   String erro = '';

//   PostosController() {
//     getPosicao();
//   }

//   getPosicao() async {
//     try {
//       Position posicao = await _posicaoAtual();
//       lat = posicao.latitude;
//       long = posicao.longitude;
//     } catch (e) {
//       erro = e.toString();
//     }
//     notifyListeners();
//   }

//   Future<Position> _posicaoAtual() async {
//     LocationPermission permissao;

//     bool ativado = await Geolocator.isLocationServiceEnabled();
//     if (!ativado) {
//       return Future.error('Ative a localização no smartphone');
//     }

//     permissao = await Geolocator.checkPermission();
//     if (permissao == LocationPermission.denied) {
//       permissao = await Geolocator.requestPermission();
//       if (permissao == LocationPermission.denied) {
//         return Future.error('Precisa autorizar o acesso à localização');
//       }
//     }

//     if (permissao == LocationPermission.deniedForever) {
//       return Future.error('Precisa autorizar o acesso à localização');
//     }

//     return await Geolocator.getCurrentPosition();
//   }
// }
