import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:saudeativa/classes/UnidadeBasica.dart';
import 'package:saudeativa/classes/Upa.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde Ativa',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saúde Ativa')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                'pasta/images/saudeativa.png',
                width: 200,
                height: 200,
              ),
            ),
            ListTile(
              title: Text('Pagina Inicial'),
              onTap: () {
                Navigator.pop(context); // Fecha o menu lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageOne()),
                );
              },
            ),
            ListTile(
              title: Text('Unidade Básica de Saúde'),
              onTap: () {
                Navigator.pop(context); // Fecha o menu lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageTwo()),
                );
              },
            ),
            ListTile(
              title: Text('Unidade de Pronto Atendimento'),
              onTap: () {
                Navigator.pop(context); // Fecha o menu lateral
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UPApage()),
                );
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.asset(
              'pasta/images/Captura de tela 2023-12-05 163315.png',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageTwo()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.green,
                  ),
                  child: Text('Consultar UBS'),
                ),
                SizedBox(width: 10), // Espaçamento entre os botões
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UPApage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.green,
                  ),
                  child: Text('Consultar UPA'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageOne()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
              ),
              child: Text('Saiba Mais'),
            ),
          ],
        ),
      ),
    );
  }
}
class PageOne extends StatelessWidget {
  final String texto =
      'Bem-vindo ao nosso aplicativo, onde sua saúde é prioridade! Nosso objetivo é simplificar sua busca por unidades de saúde básica e pronto atendimento na região metropolitana do Recife. Sabemos o quão crucial é ter acesso rápido e fácil aos serviços de saúde quando você mais precisa. Com o nosso aplicativo, você pode localizar e obter informações detalhadas sobre diversas unidades de saúde próximas a você. Seja para consultas de rotina, atendimento emergencial ou simplesmente para encontrar o local mais próximo, estamos aqui para facilitar esse processo para você. Navegue pelo mapa, encontre unidades de pronto atendimento, postos de saúde e obtenha informações sobre horários de funcionamento, serviços oferecidos e como chegar até lá. Nosso objetivo é proporcionar a você e à sua família uma experiência tranquila e eficiente ao buscar cuidados médicos. Seja bem-vindo a uma forma mais simples e direta de cuidar da sua saúde. Conte conosco para guiá-lo na direção das unidades de saúde básica e de pronto atendimento na região metropolitana do Recife.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
    child: SingleChildScrollView(
    padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'pasta/images/saudeativa.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'O aplicativo se dedica a simplificar o acesso à serviços de saúde na Região Metropolitana do Recife. Ele oferece informações detalhadas de Unidades Básicas de Saúde e Unidades de Pronto Atendimento com endereços, telefones,  especialidades médicas, horários de atendimento e mapas. Busca proporcionar uma experiência tranquila sem a necessidade de internet ou login para o seu maior conforto e acesso, prometendo colocar a saúde literalmente nas suas mãos!',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.green),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final List<UnidadeBasica> products = [
    UnidadeBasica(
        id: 01,
        nome_oficial: 'CS Prof César Montezuma',
        endereco: 'AV CAIS DO APOLO, 925 - BAIRRO DO RECIFE',
        bairro: 'BAIRRO DO RECIFE',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA GERAL, ODONTOLOGIA CLÍNICA',
        fone: '3355-4420',
        latitude: -8.05482,
        longitude: -34.87213,
        imageUrl : 'pasta/images/ubsa.png',
        maps: 'pasta/maps/ubs1.png',
      linkmaps: 'https://www.google.com/maps/place/Unidade+de+Sa%C3%BAde+da+Fam%C3%ADlia+(USF)+Mand%C3%BA+-+Joaquim+Costa+Carvalho/@-8.0220206,-34.9339255,15z/data=!4m6!3m5!1s0x7ab1997c553f7b9:0xabef47cf2b4c0edd!8m2!3d-8.0243565!4d-34.9282654!16s%2Fg%2F11b6hjy71m?hl=pt-BR&entry=ttu'
    ),
    UnidadeBasica(
        id: 02,
        nome_oficial: 'CS Prof Monteiro de Morais',
        endereco: 'AV BEBERIBE, 4510 - BEBERIBE',
        bairro: 'BEBERIBE',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'GINECOLOGIA, PEDIATRIA, CLINICA MEDICA',
        fone:'3355-6848' ,
        latitude: 0001,
        longitude: 111,
        imageUrl : 'pasta/images/ubs2.jpg',
        maps: 'pasta/maps/ubs2.png',
        linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Prof%C2%B0+Monteiro+de+Moraes/@-8.0040952,-34.8969434,15z/data=!4m2!3m1!1s0x0:0xc44abb4c9f5cb679?sa=X&ved=2ahUKEwjfrp7u0PmCAxVUELkGHXL0BvQQ_BJ6BAgREAA',
    ),

    UnidadeBasica(
        id: 04,
        nome_oficial: 'CS Francisco Pignatari',
        endereco: 'ESTRADA DO ARRAIAL, S/N1 - CASA AMARELA',
        bairro: 'CASA AMARELA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, GINECOLOGIA, ODONTOLOGIA, DERMATOLOGIA, NUTRIÇÃO',
        fone:'3355-4400',
        latitude: 0001,
        longitude: 111,
        imageUrl : 'pasta/images/ubs3.jpg',
        maps: 'pasta/maps/ubs4.png',
      linkmaps: 'https://www.google.com/maps/place/Posto+de+Sa%C3%BAde+Francisco+Pignat%C3%A1ri/@-8.0275942,-34.9186833,15z/data=!4m6!3m5!1s0x7ab19a5746dfc6f:0x10eac5a6912273eb!8m2!3d-8.0275942!4d-34.9186833!16s%2Fg%2F1q5gllmxl?entry=ttu',
    ),

    UnidadeBasica(
        id: 05,
        nome_oficial: 'CS Mário Monteiro Melo',
        endereco: 'RUA NOVA DESCOBERTA, 99  - NOVA DESCOBERTA',
        bairro: 'NOVA DESCOBERTA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA',
        fone: '3355-4385',
        latitude: 0001,
        longitude: 111,
        imageUrl : 'pasta/images/ubs4.png',
         maps: 'pasta/maps/ubs5.png',
      linkmaps: 'https://www.google.com/maps/place/Unidade+de+Sa%C3%BAde+-+M%C3%A1rio+Monteiro+de+Melo/@-8.0193461,-34.9259898,18z/data=!4m6!3m5!1s0x7ab19be677c2a63:0x9b915d1cde4077d6!8m2!3d-8.018953!4d-34.9263143!16s%2Fg%2F11g889v63h?entry=ttu',
    ),
    UnidadeBasica(
        id: 06,
        nome_oficial: 'CS Prof Bruno Maia',
        endereco: 'ALTO DO REFUGIO, S/N - NOVA DESCOBERTA',
        bairro: 'NOVA DESCOBERTA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'PEDIATRIA, GINECOLOGIA',
        fone: '3355-4416',
        latitude: 0001,
        longitude: 111,
        imageUrl : 'pasta/images/ubs6.jpg',
        maps: 'pasta/maps/ubs6.png',
      linkmaps: 'https://www.google.com/maps/place/Unidade+de+Sa%C3%BAde+Prof.+Bruno+Maia/@-8.0017304,-34.9244886,18z/data=!4m6!3m5!1s0x7ab19de99919325:0x21a7926a8bdba3bf!8m2!3d-8.0013745!4d-34.9247756!16s%2Fg%2F1ptxwtmjy?entry=ttu',
    ),
    UnidadeBasica(
        id: 07,
        nome_oficial: 'CS Iná Rosa Borges',
        endereco: 'RUA SENADOR MILTON CAMPOS, S/N  - VASCO DA GAMA',
        bairro: 'VASCO DA GAMA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA,  GINECOLOGIA, ODONTOLOGIA, DERMATOLOGIA, PEDIATRIA',
        fone: '3355-4408',
        latitude: 1212,
        longitude: 1212,
        imageUrl : 'pasta/images/ubs7.jpg',
        maps: 'pasta/maps/ubs7.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+In%C3%A1+Rosa+Borges/@-8.0165539,-34.9209702,18z/data=!4m10!1m2!2m1!1sUnidade+In%C3%A1+Rosa+Borges!3m6!1s0x7ab19c75da37b37:0x7ccdad6c1a4e93ca!8m2!3d-8.0162784!4d-34.9211309!15sChhVbmlkYWRlIEluw6EgUm9zYSBCb3JnZXOSAQ5tZWRpY2FsX2NlbnRlcuABAA!16s%2Fg%2F11b6hk31zb?entry=ttu',
    ),

    UnidadeBasica(
        id: 08,
        nome_oficial: 'CS Joaquim Costa Carvalho',
        endereco: 'RUA SIRIGI, S/N - ALTO DO MANDU',
        bairro: 'ALTO DO MANDU',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA',
        fone: '3355-4412',
        latitude: 1212,
        longitude: 1212,
        imageUrl : 'pasta/images/ubs8.jpg',
         maps: 'pasta/maps/ubs8.png',
      linkmaps: 'https://www.google.com/maps/place/Unidade+de+Sa%C3%BAde+da+Fam%C3%ADlia+(USF)+Mand%C3%BA+-+Joaquim+Costa+Carvalho/@-8.0243034,-34.9281018,18z/data=!4m6!3m5!1s0x7ab1997c553f7b9:0xabef47cf2b4c0edd!8m2!3d-8.0243565!4d-34.9282654!16s%2Fg%2F11b6hjy71m?entry=ttu',
    ),

    UnidadeBasica(
        id: 09,
        nome_oficial: 'CS Prof Joaquim Cavalcante',
        endereco: 'AV DO FORTE, 1350 - TORROES',
        bairro: 'TORROES',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA',
        fone: '3355-4425',
        latitude: 1212,
        longitude: 1212,
        imageUrl : 'pasta/images/ubs9.jpg',
        maps: 'pasta/maps/ubs9.png',
      linkmaps: 'https://www.google.com/maps/place/Unidade+de+Sa%C3%BAde+Prof.+Joaquim+Cavalcanti/@-8.0589773,-34.9344422,17z/data=!3m1!4b1!4m6!3m5!1s0x7ab1946fef14a5b:0x44749e0212fcf7dd!8m2!3d-8.0589773!4d-34.9318619!16s%2Fg%2F1tfbhydp?entry=ttu',
    ),

    UnidadeBasica(
        id: 10,
        nome_oficial: 'CS Dr José Dustan Carvalho Soares',
        endereco: 'RUA MAURICIO DE NASSAU S/N CAIARA  - IPUTINGA',
        bairro: 'IPUTINGA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLINICA MEDICA, ODONTOLOGIA, PEDIATRIA, DERMATOLOGIA',
        fone: '33554388',
        latitude: 1212,
        longitude: 1212,
        imageUrl : 'pasta/images/ubs10.jpg',
        maps: 'pasta/maps/ubs11.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Dr+Jos%C3%A9+Dustan+Soares/@-8.0386224,-34.9335113,17z/data=!3m1!4b1!4m6!3m5!1s0x7ab19737580e7b9:0x6cd4cfc7eb6ebf66!8m2!3d-8.0386277!4d-34.9309364!16s%2Fg%2F1vlqqdt7?entry=ttu',
    ),


    UnidadeBasica(
        id: 11,
        nome_oficial: 'CS Olinto Oliveira',
        endereco: 'RUA SÃO FRANCISCO DE PAULA, 47- CAXANGÁ',
        bairro: 'CAXANGA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICO GERAL, ENFERMAGEM,  GINECOLOGIA, DERMATOLOGIA  E ODONTOLOGIA',
        fone: '3355-6442/6443',
        latitude: 1212,
        longitude: 1212,
        imageUrl : 'pasta/images/ubs11.jpg',
        maps: 'pasta/maps/ubs10.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Olinto+Oliveira/@-8.0309657,-34.9527283,15z/data=!4m6!3m5!1s0x7ab1a2b510834a1:0x48c93e526b0eec7d!8m2!3d-8.0306789!4d-34.9557216!16s%2Fg%2F1tfqr4h3?entry=ttu',
    ),

    UnidadeBasica(
        id: 12,
        nome_oficial: 'CS Gaspar Regueira Costa',
        endereco: 'RUA PADRE DIOGO RODRIGUES, 144 - BARRO',
        bairro: 'BARRO',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA,  GINECOLOGIA, ODONTOLOGIA COM ODONTOPEDIATRA',
        fone: '3355-4404',
        latitude: 1212,
        longitude: 1212,
        imageUrl : 'pasta/images/ubs12.jpg',
        maps: 'pasta/maps/ubs12.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Gaspar+Regueira+Costa%2FBarro/@-8.0899687,-34.9421739,17z/data=!4m6!3m5!1s0x7ab1e9851456b47:0xea50680395e391a7!8m2!3d-8.0898466!4d-34.9421739!16s%2Fg%2F11c5rvz8f8?entry=ttu',
    ),

    UnidadeBasica(
        id: 13,
        nome_oficial: 'CS Bidu Krause',
        endereco: 'AV ONZE DE AGOSTO, S/N - TOTO',
        bairro: 'TOTO',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLINICA MÉDICA,  PEDIATRIA, GINECOLOGIA, ODONTOLOGIA, FISIOTERAPIA, DERMATOLOGIA',
        fone: '3355-0301',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs13.jpg',
      maps: 'pasta/maps/ubs13.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Bido+Krause/@-8.0795405,-34.9683295,16z/data=!4m6!3m5!1s0x7ab1c13737218d9:0xd920a9c84ac2d0b3!8m2!3d-8.079668!4d-34.9702607!16s%2Fg%2F11b6p7cw7_?entry=ttu',
    ),

    UnidadeBasica(
        id: 14,
        nome_oficial: 'CS Professor Fernandes Figueiras',
        endereco: 'AV SÃO PAULO, 605  - JARDIM SÃO PAULO',
        bairro: 'JARDIM SAO PAULO',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, GINECOLOGIA, NUTRIÇÃO',
        fone: '3355-4396',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs14.jpg',
      maps: 'pasta/maps/ubs14.png',
      linkmaps: 'https://www.google.com/maps/place/US+150+CS+Professor+Fernandes+Figueiras/@-8.0816674,-34.9397769,17z/data=!4m6!3m5!1s0x7ab1eba48fc5597:0x707e96870deb2fa8!8m2!3d-8.081216!4d-34.9403563!16s%2Fg%2F11gf2wp3sq?entry=ttu',
    ),
    UnidadeBasica(
        id: 15,
        nome_oficial: 'Pam Ceasa',
        endereco: 'BR 101 GIRADOR DO CURADO - CURADO',
        bairro: 'CURADO',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLINICA MEDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA',
        fone: '3355-0090',
        latitude: 1231,
        longitude: 12312,
        imageUrl : 'pasta/images/ubs15.jpg',
        maps: 'pasta/maps/ubs15.png',
      linkmaps: 'https://www.google.com/maps/place/Posto+de+sa%C3%BAde+Ceasa+PAM+-+CEASA/@-8.0737438,-34.942353,17z/data=!4m6!3m5!1s0x7ab1f1518ff204d:0xb82ad9e134d4f9d8!8m2!3d-8.0730215!4d-34.9433347!16s%2Fg%2F11j3llw5w7?entry=ttu',
    ),

    UnidadeBasica(
        id: 16,
        nome_oficial: 'CS Prof Romero Marques',
        endereco: 'RUA CARLOS GOMES, 932 - PRADO',
        bairro: 'PRADO',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLINICA MEDICA, GINECOLOGIA, ODONTOLOGIA COM ODONTOPEDIATRA, PEDIATRIA',
        fone: '33554440',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs16.jpg',
      maps: 'pasta/maps/ubs16.png',
      linkmaps: 'https://www.google.com/maps/place/CS+-+Prof%C2%BA.+Romero+Marques/@-8.0639407,-34.913858,17z/data=!4m6!3m5!1s0x7ab192f6bd903ef:0x6ccb9aee12b4f3d2!8m2!3d-8.0638239!4d-34.9136595!16s%2Fg%2F1tn01fr8?entry=ttu',
    ),

    UnidadeBasica(
        id: 17,
        nome_oficial: 'CS Sebastião Ivo Rabelo',
        endereco: 'AV CAMPINA GRANDE, S/N, UR 1- COHAB',
        bairro: 'COHAB',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA, REUMATOLOGIA, DERMATOLOGIA, PSICOLOGIA, PSIQUIATRIA',
        fone: '33555445',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs17.jpg',
      maps: 'pasta/maps/ubs17.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Professor+Sebasti%C3%A3o+Ivo+Rabelo/@-8.1196393,-34.9505029,17z/data=!3m1!4b1!4m6!3m5!1s0x7ab1e7682c57723:0x3f72216efe8ee089!8m2!3d-8.1196393!4d-34.9479226!16s%2Fg%2F11b6hm0h49?entry=ttu',
    ),

    UnidadeBasica(
        id: 18,
        nome_oficial: 'CS Dr Aristarco Azevedo',
        endereco: 'RUA BAHIA, 29  - JORDAO',
        bairro: 'JORDAO',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'PEDIATRIA, GINECOLOGIA, CLÍNICA MÉDICA',
        fone: '3355-4380',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs18.jpg',
      maps: 'pasta/maps/ubs18.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Dr+Aristarco+de+Azevedo/@-8.1314312,-34.9373602,17z/data=!4m6!3m5!1s0x7ab1e1a6b61575d:0x55a5c8a39242a449!8m2!3d-8.1315799!4d-34.9369901!16s%2Fg%2F1tfp_11c?entry=ttu',
    ),

    UnidadeBasica(
        id: 19,
        nome_oficial: 'CS Prof José Carneiro Leão',
        endereco: 'RUA NOGUEIRA DE SOUZA, 334  - PINA',
        bairro: 'PINA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA COM ODONTOPEDIATRIA',
        fone: '3355-4428',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs19.jpg',
      maps: 'pasta/maps/ubs19.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Prof.+Jos%C3%A9+Carneiro+Le%C4%81o/@-8.0873854,-34.8892227,17z/data=!4m6!3m5!1s0x7ab1f4d3b134ac5:0x36f3d68e28996933!8m2!3d-8.0873323!4d-34.8897645!16s%2Fg%2F11h_5gs77k?entry=ttu',
    ),

    UnidadeBasica(
        id: 20,
        nome_oficial: 'CS Ver Romildo Gomes',
        endereco: 'RUA JALISCO, S/N  - IMBIRIBEIRA',
        bairro: 'IMBIRIBEIRA',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, ODONTOLOGIA COM CEO, ACUPUNTURA, PSICOLOGIA, GASTROENTEROLOGIA, CARDIOLOGIA, DERMATOLOGIA, PSIQUIATRIA, PNEUMOLOGIA, GERIATRIA, ENDOCRINOLOGIA',
        fone: '3355-4448',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs20.jpg',
      maps: 'pasta/maps/ubs20.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Ver+Romildo+Jos%C3%A9+Ferreira+Gomes/@-8.1157005,-34.9107627,17z/data=!4m10!1m2!2m1!1sCentro+de+Sa%C3%BAde+er+Romildo+Gomes!3m6!1s0x7ab1e522a5faf39:0x6ccbb32d4d64dae3!8m2!3d-8.1167285!4d-34.9110502!15sCiFDZW50cm8gZGUgU2HDumRlIGVyIFJvbWlsZG8gR29tZXNaIyIhY2VudHJvIGRlIHNhw7pkZSBlciByb21pbGRvIGdvbWVzkgEVcHVibGljX21lZGljYWxfY2VudGVymgEjQ2haRFNVaE5NRzluUzBWSlEwRm5TVU5YZERsSUxVcEJFQUXgAQA!16s%2Fg%2F11b6hq7f9s?entry=ttu',
    ),

    UnidadeBasica(
        id: 21,
        nome_oficial: 'CS Prof Djair Brindeiro',
        endereco: 'RUA COSMORAMA, S/N  - BOA VIAGEM',
        bairro: 'BOA VIAGEM',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, GINECOLOGIA',
        fone: '3355-0119',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs21.jpg',
      maps: 'pasta/maps/ubs21.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Prof.+Djair+Brindeiro+-+Comar/@-8.1485422,-34.913168,17z/data=!4m6!3m5!1s0x7aae1d6d9827353:0x507a753b9b4391ad!8m2!3d-8.1481492!4d-34.9136562!16s%2Fg%2F11b6hr5rhz?entry=ttu',
    ),

    UnidadeBasica(
        id: 22,
        nome_oficial: 'CS Dom Miguel de Lima Valverde',
        endereco: 'RUA FELICIANO JOSE DE FARIAS, 195  - BOA VIAGEM',
        bairro: 'BOA VIAGEM',
        horario: 'SEGUNDA A SEXTA 08:00 às 17:00',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, GINECOLOGIA, DERMATOLOGIA, ENDOCRINOLOGIA, NUTRIÇÃO, ODONTOLOGIA, PSICOLOGIA, GERIATRIA, COLPOSCOPIA',
        fone: '33550061',
        latitude: 1212,
        longitude: 12231,
        imageUrl : 'pasta/images/ubs22.jpg',
      maps: 'pasta/maps/ubs22.png',
      linkmaps: 'https://www.google.com/maps/place/Centro+de+Sa%C3%BAde+Dom+Miguel+de+Lima+Valverde/@-8.1334587,-34.9049285,17z/data=!4m6!3m5!1s0x7ab1fcb6ead5025:0xc35b1d3eac19809!8m2!3d-8.1334268!4d-34.9047193!16s%2Fg%2F1tgxtrn4?entry=ttu',
    ),

  ];
  List<UnidadeBasica> filteredProducts = []; // Lista filtrada para exibição
  @override
  void initState() {
    filteredProducts = List.from(products); // Inicializa com a lista completa
    super.initState();
  }

  void filterList(String query) {
    setState(() {
      filteredProducts = products
          .where((unit) => unit.bairro.toLowerCase().contains(query.toLowerCase()))
          .toList();

    });
  }
  void filterEspec(String query) {
    setState(() {
      filteredProducts = products
          .where((unit) => unit.especialidade.toLowerCase().contains(query.toLowerCase()))
          .toList();

    });
  }

  void showDetails(UnidadeBasica unit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(unit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unidades de Saúde')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterList(value),
              decoration: InputDecoration(
                labelText: 'Filtrar por Bairro',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterEspec(value),
              decoration: InputDecoration(
                labelText: 'Filtrar por Especialidade',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final unit = filteredProducts[index];
                return Card(
                  elevation: 2, // Elevação da carta
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // Borda arredondada da carta
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green, // Cor de fundo do avatar
                      backgroundImage: AssetImage('${unit.imageUrl}'), // Caminho para a imagem asset da unidade
                    ),
                    title: Text(
                      unit.nome_oficial,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(unit.endereco),
                    onTap: () => showDetails(unit), // Adiciona função ao clicar na unidade
                    // Outras informações da unidade de saúde
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class DetailsScreen extends StatelessWidget {
  final UnidadeBasica unit;

  DetailsScreen(this.unit);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(unit.nome_oficial)),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unidade de Saúde:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit.nome_oficial,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              unit.especialidade,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Endereço:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit.endereco,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Bairro:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit.bairro,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Horário de Atendimento:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit.horario,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Telefone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit.fone,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Especialidade:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text(
                unit.especialidade,
                style: TextStyle(fontSize: 16)
            ),
            Text(
              'Imagem da UBS:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(
              unit.imageUrl, //
              width: 500,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              'Google Maps:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launchURL(unit.linkmaps), // Função que será chamada ao clicar na imagem
              child: Image.asset(
                unit.maps,
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Clique na imagem para abrir o Google Maps',
              style: TextStyle(fontSize: 14),
            ),
              ]
        ),

      ),
    );
  }
}



class DetailsScreen2 extends StatelessWidget {
  final Upa unit2;

  DetailsScreen2(this.unit2);
  void _launchURL2 (String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(unit2.nome_oficial)),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unidade de Saúde:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit2.nome_oficial,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Endereço:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit2.endereco,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Bairro:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit2.bairro,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Horário de Atendimento:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit2.horario,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Telefone:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              unit2.fone,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Especialidade:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text(
                unit2.especialidade,
                style: TextStyle(fontSize: 16)
            ),
            Text(
              'Imagem da Unidade:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(
              unit2.imageUrl, //
              width: 500,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              'Google Maps:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launchURL2(unit2.linkmaps), // Função que será chamada ao clicar na imagem
              child: Image.asset(
                unit2.maps,
                width: 500,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Clique na imagem para abrir o Google Maps',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
class UPApage extends StatefulWidget {
  @override
  _UPAState createState() => _UPAState();
}

class _UPAState extends State<UPApage> {
  final List<Upa> products = [

    Upa(
        id: 01,
        nome_oficial: 'UPA Barra de Jangada – Senador Wilson Campos',
        endereco: 'Rua Cruz Alta, S/N (em frente à estação de tratamento da da Compesa)',
        bairro: 'Barra de Jangada',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4496',
        imageUrl: 'pasta/images/upa1.jpg',
        maps:'pasta/maps/upa1.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+-+Unidade+de+Pronto+Atendimento+-+Tipo+III+Barra+de+Jangada/@-8.2193591,-34.93572,17z/data=!4m6!3m5!1s0x7aae6b4a0eaf51b:0x4aa267bcb0e37215!8m2!3d-8.2191043!4d-34.9340785!16s%2Fg%2F11bc73px4m?entry=ttu'

    ),
    Upa(
        id: 02,
        nome_oficial: 'UPA Cabo de Santo Agostinho – Deputado Francisco Julião',
        endereco: 'Rua 27, S/N',
        bairro: 'Cohab',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA',
        fone: '3184.4549',
        imageUrl: 'pasta/images/upa2.jpg'
        ,
        maps:'pasta/maps/upa2.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+-+Deputado+Francisco+Juli%C3%A3o/@-8.295663,-35.0265448,15z/data=!4m6!3m5!1s0x7aae55f4e3563ad:0x5b9fdcc2d8a1e577!8m2!3d-8.2966397!4d-35.027446!16s%2Fg%2F11b5wdlzcv?entry=ttu'
    ),

    Upa(
        id: 03,
        nome_oficial: 'UPA Caxangá – Escritor Paulo Cavalcanti',
        endereco: 'Avenida Caxangá, S/N (em frente ao nº 40 da Rua Ribeiro Pessoa)',
        bairro: 'Várzea',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4355',
        imageUrl: 'pasta/images/upa3.jpg',
        maps:'pasta/maps/upa3.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+-+Caxang%C3%A1/@-7.9631605,-34.9967701,15z/data=!4m6!3m5!1s0x7ab1a2cc107a1e7:0x18aa7cb7640d2027!8m2!3d-8.0298067!4d-34.9576641!16s%2Fg%2F1yhbjs_5v?entry=ttu'
    ),

    Upa(
        id: 04,
        nome_oficial: 'UPA Curado – Médico Fernando de Lacerda',
        endereco: 'Avenida Leonardo da Vinci, 68',
        bairro: 'Curado II',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4472',
        imageUrl: 'pasta/images/upa4.jpg',
        maps:'pasta/maps/upa4.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+Curado+-+Unidade+de+Pronto+Atendimento+M%C3%A9dico+Fernando+de+Lacerda/@-8.0800061,-34.9975229,15z/data=!4m6!3m5!1s0x7ab1c890d66fe35:0x947a304bfd18a136!8m2!3d-8.0807709!4d-34.9967504!16s%2Fg%2F1td_5c_1?entry=ttu'
    ),
    Upa(
        id: 05,
        nome_oficial: 'UPA Engenho Velho – Governador Carlos Wilson',
        endereco: 'Rua General Manoel Rabelo, S/N (na esquina com a Estrada do Eixo da Integração)',
        bairro: 'Engenho Velho',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, ODONTOLOGIA',
        fone: '3184.4524',
        imageUrl: 'pasta/images/upa5.jpg',
        maps:'pasta/maps/upa5.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+Engenho+Velho/@-8.11096,-35.0092253,17z/data=!3m1!4b1!4m6!3m5!1s0x7ab1d1039813f19:0x72bee15b9eaa9b2b!8m2!3d-8.11096!4d-35.006645!16s%2Fg%2F1pxwj9pd8?entry=ttu'
    ),

    Upa(
        id: 06,
        nome_oficial: 'UPA Ibura – Pediatra Zilda Arns',
        endereco: 'Rua Vale do Itajaí, S/N',
        bairro: 'Ibura',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4599',
        imageUrl: 'pasta/images/upa6.jpg',
        maps:'pasta/maps/upa6.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+Ibura/@-8.1290614,-34.9490118,17z/data=!4m6!3m5!1s0x7ab1e09f5e5de01:0xb918aee82348ba78!8m2!3d-8.1288118!4d-34.9494678!16s%2Fg%2F11b5wpnknj?entry=ttu'
    ),
    Upa(
        id: 07,
        nome_oficial: 'UPA Imbiribeira – Maria Esther Souto Carvalho',
        endereco: 'Avenida Mascarenhas de Moraes, 4223',
        bairro: 'Imbiribeira',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4339',
        imageUrl: 'pasta/images/upa7.jpg',
        maps:'pasta/maps/upa7.png',
        linkmaps: 'https://www.google.com/maps/place/Unidade+de+Pronto+Atendimento+Maria+Esther+Souto+Carvalho/@-8.1213256,-34.9130928,16z/data=!4m6!3m5!1s0x7ab1e4ef7a6a8e9:0x74c3949674e3f50d!8m2!3d-8.1209008!4d-34.9138653!16s%2Fg%2F1pt_cfvl5?entry=ttu'
    ),

    Upa(
        id: 08,
        nome_oficial: 'UPA Nova Descoberta – Solano Trindade',
        endereco: 'Avenida Vereador Otacílio de Azevedo, S/N',
        bairro: 'Nova Descoberta',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA,ODONTOLOGIA',
        fone: '3184.4581',
        imageUrl: 'pasta/images/upa8.jpg',
        maps:'pasta/maps/upa8.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+Nova+Descoberta+%E2%80%93+Solano+Trindade/@-8.0019775,-34.9189583,17z/data=!4m6!3m5!1s0x7ab19d1bd29a771:0x7b4b41e04cf5e95b!8m2!3d-8.0019138!4d-34.9196181!16s%2Fg%2F11b6hkw9tg?entry=ttu'
    ),

    Upa(
        id: 09,
        nome_oficial: 'UPA Olinda – Gregório Lourenço de Menezes',
        endereco: 'Rodovia PE-15 – Avenida Joaquim Nabuco, S/N (em frente ao nº 798)',
        bairro: 'Cidade Tabajara',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA, ODONTOLOGIA',
        fone: '3184.4310',
        imageUrl: 'pasta/images/upa9.jpg',
        maps:'pasta/maps/upa9.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+Olinda/@-7.9804626,-34.8594931,17z/data=!4m6!3m5!1s0x7ab3d6248833125:0xe22cfa80e740c3c!8m2!3d-7.9797507!4d-34.8597452!16s%2Fg%2F11b5wf482z?entry=ttu'
    ),

    Upa(
        id: 10,
        nome_oficial: 'UPA Paulista – Geraldo Pinho Alves',
        endereco: 'Estrada do Frio, 10000, Aurora',
        bairro: 'Jardim Paulista',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, ODONTOLOGIA',
        fone: '3184.4256',
        imageUrl: 'pasta/images/upa10.jpg',
        maps:'pasta/maps/upa10.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+Paulista/@-7.9484194,-34.889223,16z/data=!4m10!1m2!2m1!1sUPA+Paulista+%E2%80%93+Geraldo+Pinho+Alves!3m6!1s0x7ab1643d0ccac33:0xdf9c9c3ff4408ad3!8m2!3d-7.9482143!4d-34.8902862!15sCiRVUEEgUGF1bGlzdGEg4oCTIEdlcmFsZG8gUGluaG8gQWx2ZXMiA_ABAZIBCGhvc3BpdGFs4AEA!16s%2Fg%2F1ptzckbj0?entry=ttu'
    ),
    Upa(
        id: 11,
        nome_oficial: 'UPA São Lourenço da Mata – Professor Fernando Figueira',
        endereco: 'Avenida Dr. Francisco Correia, 2009',
        bairro: 'Pixete',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4381',
        imageUrl: 'pasta/images/upa11.jpg',
        maps:'pasta/maps/upa12.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+S%C3%A3o+Louren%C3%A7o+da+Mata+-+Professor+Fernando+Figueira/@-7.9915758,-35.0493938,17z/data=!4m6!3m5!1s0x7ab055096859f51:0x96767238a4f5141b!8m2!3d-7.9912358!4d-35.0489271!16s%2Fg%2F11b6vcmtdx?entry=ttu'
    ),

    Upa(
        id: 12,
        nome_oficial: 'UPA Torrões – Dulce Sampaio',
        endereco: 'Avenida Abdias de Carvalho, 30 (em frente ao nº 1455)',
        bairro: 'Torrões',
        horario: '24h',
        especialidade: 'CLÍNICA MÉDICA, PEDIATRIA, TRAUMA-ORTOPEDIA',
        fone: '3184.4447',
        imageUrl: 'pasta/images/upa12.jpg',
        maps:'pasta/maps/upa11.png',
        linkmaps: 'https://www.google.com/maps/place/UPA+-+Unidade+de+Pronto+Atendimento+-+Tipo+III+Torr%C3%B5es/@-8.0638625,-34.9344119,17z/data=!4m6!3m5!1s0x7ab194f2ad2d97f:0x2817127124162a57!8m2!3d-8.0632358!4d-34.9342027!16s%2Fg%2F11bzr6km5f?entry=ttu'
    )


  ];
  List<Upa> filteredProducts = []; // Lista filtrada para exibição
  @override
  void initState() {
    filteredProducts = List.from(products); // Inicializa com a lista completa
    super.initState();
  }

  void filterList(String query) {
    setState(() {
      filteredProducts = products
          .where((unit2) => unit2.bairro.toLowerCase().contains(query.toLowerCase()))
          .toList();

    });
  }
  void filterEspec(String query) {
    setState(() {
      filteredProducts = products
          .where((unit2) => unit2.especialidade.toLowerCase().contains(query.toLowerCase()))
          .toList();

    });
  }

  void showDetails(Upa unit2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen2(unit2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unidade de Pronto de Atendimento")),
      body: Column(
        children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) => filterList(value),
        decoration: InputDecoration(
          labelText: 'Filtrar por Bairro',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Borda arredondada
          ),
        ),
      ),
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterEspec(value),
              decoration: InputDecoration(
                labelText: 'Filtrar por Especialidade',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Borda arredondada
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final unit2 = filteredProducts[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: ListTile(
                leading: CircleAvatar(
                backgroundColor: Colors.green, // Cor de fundo do avatar
                backgroundImage: AssetImage('${unit2.imageUrl}'),
                ),// Caminho para a imagem asset da unidade
                    title: Text(
                      unit2.nome_oficial,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(unit2.endereco),
                    onTap: () => showDetails(unit2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


















final UnidadeBasica instanceOfUnidadeBasicaClass = UnidadeBasica(id: 00,nome_oficial: 'nome_oficial', endereco: 'endereço', bairro: 'bairro', horario: 'horario',especialidade: 'especialidade', fone: '1', latitude: 12, longitude: 12, imageUrl: '', maps: '', linkmaps: '');
//now using this inscance, access the list.
final list = instanceOfUnidadeBasicaClass.unidadebasicas;

int id = list[0].id;
String name = list[0].nome_ofcial;
String desc = list[0].endereco;
String endereco = list[0].endereco;
String bairro = list[0].bairro;
String horario = list[0].horario;


