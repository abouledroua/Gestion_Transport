class Transport {
  int idTransport, etat;
  String date,
      heure,
      ref,
      nomClient,
      telClient,
      nomTransporteurExterne,
      poste,
      destination;
  double montantProduit, montantLivrInterne, montantLivrExterne, total;

  Transport(
      {required this.idTransport,
      required this.date,
      required this.nomClient,
      required this.heure,
      required this.destination,
      required this.etat,
      required this.montantLivrExterne,
      required this.montantLivrInterne,
      required this.montantProduit,
      required this.nomTransporteurExterne,
      required this.poste,
      required this.telClient,
      required this.total,
      required this.ref});
}
