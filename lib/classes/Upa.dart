class Upa {

  late final int id ;
  late final String nome_oficial, endereco, bairro, horario;
  late final String como_usar;
  late final String especialidade,fone;
  late final double latitude;
  late final double longitude;
  late final String imageUrl;
  late final String maps;
  late final String linkmaps;

//List has been removed from the class itself

  Upa({
    required this.id,
    required this.nome_oficial,
    required this.endereco,
    required this.bairro,
    required this.horario,
    required this.fone,
    required this.especialidade,
    // required this.latitude,
    // required this.longitude,
    required this.imageUrl,
    required this.maps,
    required  this.linkmaps,
  });

  get upas => null;
}
