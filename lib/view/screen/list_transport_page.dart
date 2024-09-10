import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../core/class/transport.dart';
import '../../core/constant/sizes.dart';
import '../widgets/homepage/custom_appbar.dart';
import 'myscreen.dart';

class ListTransportPage extends StatelessWidget {
  const ListTransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tableController = PagedDataTableController<String, Transport>();
    return MyScreen(
        child: Column(children: [
      const CustomAppbar(),
      const SizedBox(height: appPadding),
      Center(
          child: Text('Liste des Transports',
              style: Theme.of(context).textTheme.titleLarge)),
      const SizedBox(height: appPadding),
      // Expanded(
      //     child: DataTable(
      //         sortColumnIndex: 2,
      //         sortAscending: false,
      //         columns: [
      //           const DataColumn(label: Text('N°'), numeric: true),
      //           const DataColumn(label: Text('Réf')),
      //           DataColumn(
      //               label: const Text('Date'),
      //               onSort: (columnIndex, ascending) {}),
      //           const DataColumn(label: Text('Heure')),
      //           const DataColumn(label: Text('Client')),
      //           const DataColumn(label: Text('Télephone')),
      //           const DataColumn(label: Text('Montant Produit')),
      //           const DataColumn(label: Text('Montant Livraison Interne')),
      //           const DataColumn(label: Text('Montant Livraison Externe')),
      //           const DataColumn(label: Text('Total')),
      //           const DataColumn(label: Text('Transporteur Externe')),
      //           const DataColumn(label: Text('Etat')),
      //           const DataColumn(label: Text('Poste')),
      //           const DataColumn(label: Text('Déstination'))
      //         ],
      //         rows: listTransport
      //             .map((Transport item) => DataRow(cells: [
      //                   DataCell(Text(item.idTransport.toString())),
      //                   DataCell(Text(item.ref)),
      //                   DataCell(Text(item.date)),
      //                   DataCell(Text(item.heure)),
      //                   DataCell(Text(item.nomClient)),
      //                   DataCell(Text(item.telClient)),
      //                   DataCell(Text(
      //                       "${item.montantProduit.toStringAsFixed(2)} DA")),
      //                   DataCell(Text(
      //                       '${item.montantLivrInterne.toStringAsFixed(2)} DA')),
      //                   DataCell(Text(
      //                       '${item.montantLivrExterne.toStringAsFixed(2)} DA')),
      //                   DataCell(Text('${item.total.toStringAsFixed(2)} DA')),
      //                   DataCell(Text(item.nomTransporteurExterne)),
      //                   DataCell(Text(item.etat == 1 ? "Actif" : "Annuler")),
      //                   DataCell(Text(item.poste)),
      //                   DataCell(Text(item.destination))
      //                 ]))
      //             .toList()
      //             .cast<DataRow>())),
      // const SizedBox(height: appPadding),
      Expanded(
          child: PagedDataTableTheme(
              data: PagedDataTableThemeData(
                  selectedRow: const Color(0xFFCE93D8),
                  rowColor: (index) => index.isEven ? Colors.purple[50] : null),
              child: Text('sss')))
    ]));
  }
}

List<Transport> listTransport = [
  Transport(
      date: "22/02/2024",
      destination: "Annaba - Eulma",
      etat: 1,
      heure: "13:07",
      idTransport: 1,
      montantLivrExterne: 0,
      montantLivrInterne: 0,
      montantProduit: 23000,
      nomClient: "TOUFIK",
      nomTransporteurExterne: "",
      poste: "SERVEUR ANNABA",
      ref: "",
      telClient: "077777777",
      total: 2300),
  Transport(
      date: "02/04/2024",
      destination: "Annaba - Eulma",
      etat: 1,
      heure: "09:07",
      idTransport: 2,
      montantLivrExterne: 200,
      montantLivrInterne: 3000,
      montantProduit: 40000,
      nomClient: "AMMAR",
      nomTransporteurExterne: "",
      poste: "SERVEUR EULMA",
      ref: "",
      telClient: "06666666",
      total: 50000)
];
