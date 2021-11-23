import 'package:flutter/material.dart';
import 'package:postos_locais/shared/styles/colors.dart';

//////////////////////////////////////////////////////

class Person {
  String nome = "", idade = "", score = "";

  Person({String idade, String nome, String score}) {
    this.nome = nome;
    this.idade = idade;
    this.score = score;
  }
}

class ListFriends extends StatelessWidget {
  const ListFriends({Key key}) : super(key: key);

  static List<Person> persons = [
    Person(
        nome: 'Dário Matos',
        idade: '26',
        score:
            'https://upload.wikimedia.org/wikipedia/commons/7/77/Tiago_Felizardo.jpg'),
    Person(
        nome: 'Pedro Almeida',
        idade: '29',
        score:
            'https://www.unibanco.pt/blog/wp-content/uploads/sites/3/2021/10/Tiago-Aldeia-6.jpg'),
    Person(
        nome: 'Pedro Valente',
        idade: '43',
        score:
            'https://upload.wikimedia.org/wikipedia/commons/0/0f/%C3%80lex_Roig_Mangues.jpg'),
    Person(
        nome: 'Samuel Duarte',
        idade: '36',
        score:
            'https://s2.glbimg.com/OIDu_bahS86I2aaF_ikYx-QSAZc=/0x0:561x420/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2021/M/r/RAQAMoS8GKkh76qLhE2A/cr7.jpg'),
  ];

  //persons.sort(a,b) => a.score.compareTo(b.score);

  @override
  Widget build(BuildContext context) {
    const title = 'Friends';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        backgroundColor: kAppBarBackgroundColor,
        appBar: AppBar(
          backgroundColor: kAppBarBackgroundColor,
          title: const Text(title),
          actions: <Widget>[
            new Container(),
            // new Center(
            //     child: Text(
            //   'Score      ',
            //   textAlign: TextAlign.center,
            //   style: new TextStyle(
            //     fontSize: 20.0,
            //     color: Colors.white,
            //   ),
            // )),
          ],
        ),
        body: ListView.builder(
            //reverse: order,
            itemCount: persons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        //_listaItens(persons[index].nome + "", ""),
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(persons[index].score),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(persons[index].nome,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("age: " + persons[index].idade,
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        Spacer(),
                        // Text(persons[index].score,
                        //     style: TextStyle(
                        //         fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   onTap: () {},
                  //   title: Text(persons[index].nome),
                  //   leading: _listaItens(persons[index].nome + "", ""),
                  // ),
                ),
              );
            }),
      ),
    );
  }
}

_listaItens(String nome, String imagem) {
  Color _color = kFirstColor;
  var nomeInicial = nome[0].toUpperCase();
  if (imagem.length > 0) {
    nomeInicial = "";
  }

  return CircleAvatar(
    backgroundColor: _color,
    foregroundColor: Colors.black,
    backgroundImage: NetworkImage(imagem),
    radius: 25.0,
    child: Text(nomeInicial,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
  );
}
