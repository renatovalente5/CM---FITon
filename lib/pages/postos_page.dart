import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:postos_locais/controllers/postos_controller.dart';
import 'package:provider/provider.dart';

final appKey = GlobalKey();

class PostosPage extends StatelessWidget {
  const PostosPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appKey,
      appBar: AppBar(
        title: Text('Friends Locations'),
      ),
      body: ChangeNotifierProvider<PostosController>(
        create: (context) => PostosController(),
        child: Builder(builder: (context) {
          final local = context.watch<PostosController>();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              //target: LatLng(local.lat, local.long), // mudar para Aveiro
              target: LatLng(40.6427, -8.64654),
              zoom: 15,
            ),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: local.onMapCreated,
            markers: local.markers,
          );
        }),
      ),
    );
  }
}
