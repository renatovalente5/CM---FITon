import 'package:postos_locais/models/posto.dart';

class Account {
  String name;
  String picture;
  String qrCode;
  Posto posto;
  int showPosto;

  Account({
    this.name,
    this.picture,
    this.qrCode,
    this.posto,
    this.showPosto,
  });
}
