class Transport {
  int idTransport, etat, exercice, idClient, idTransporteurExterne;
  String date,
      heure,
      nomClient,
      tel1Client,
      tel2Client,
      nomTransporteurExterne,
      poste,
      username,
      destination;
  double montantProduit, montantLivrInterne, montantLivrExterne, total;

  Transport(
      {required this.idTransport,
      required this.exercice,
      required this.date,
      required this.heure,
      required this.nomClient,
      required this.destination,
      required this.montantLivrExterne,
      required this.montantLivrInterne,
      required this.montantProduit,
      required this.nomTransporteurExterne,
      required this.idTransporteurExterne,
      required this.poste,
      required this.tel1Client,
      required this.tel2Client,
      required this.username,
      required this.idClient,
      required this.total,
      required this.etat});
}
