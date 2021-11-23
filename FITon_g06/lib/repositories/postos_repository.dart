import 'package:flutter/material.dart';
import 'package:postos_locais/models/posto.dart';

class PostosRepository extends ChangeNotifier {
  final List<Posto> _postos = [
    Posto(
      nome: 'Dário Matos',
      endereco: '',
      foto:
          'https://upload.wikimedia.org/wikipedia/commons/7/77/Tiago_Felizardo.jpg',
      latitude: 40.64427,
      longitude: -8.64554,
    ),
    Posto(
      nome: 'Pedro Almeida',
      endereco: '',
      foto:
          'https://www.unibanco.pt/blog/wp-content/uploads/sites/3/2021/10/Tiago-Aldeia-6.jpg',
      latitude: 40.6412,
      longitude: -8.65362,
    ),
    Posto(
      nome: 'Pedro Valente',
      endereco: '',
      foto:
          'https://upload.wikimedia.org/wikipedia/commons/0/0f/%C3%80lex_Roig_Mangues.jpg',
      latitude: 40.6312,
      longitude: -8.6532,
    ),
    Posto(
      nome: 'Samuel Duarte',
      endereco: '',
      foto:
          'https://s2.glbimg.com/OIDu_bahS86I2aaF_ikYx-QSAZc=/0x0:561x420/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2021/M/r/RAQAMoS8GKkh76qLhE2A/cr7.jpg',
      latitude: 40.6462,
      longitude: -8.65262,
    ),
  ];

  List<Posto> get postos => _postos;
}
