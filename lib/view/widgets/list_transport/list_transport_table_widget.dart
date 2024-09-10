import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/listtransport_controller.dart';
import '../../../core/constant/color.dart';

class ListTransportWidgetTable extends StatelessWidget {
  const ListTransportWidgetTable({super.key, required this.myData});

  final MyData myData;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child: PaginatedDataTable(
              source: myData,
              rowsPerPage: 10,
              sortAscending: false,
              header: Text('Liste des Transports',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center),
              sortColumnIndex: 2,
              actions: [
            IconButton(
                onPressed: () {
                  ListTransportsController controller = Get.find();
                  controller.getList(showMessage: true);
                },
                icon: const Icon(Icons.refresh))
          ],
              columns: [
            const DataColumn(label: Text('N°'), numeric: true),
            const DataColumn(label: Text('Réf')),
            DataColumn(
                label: const Text('Date'), onSort: (columnIndex, ascending) {}),
            const DataColumn(label: Text('Heure')),
            const DataColumn(label: Text('Client')),
            const DataColumn(label: Text('Télephone')),
            const DataColumn(label: Text('Montant Produit')),
            const DataColumn(label: Text('Montant Livraison Interne')),
            const DataColumn(label: Text('Montant Livraison Externe')),
            const DataColumn(label: Text('Total')),
            const DataColumn(label: Text('Transporteur Externe')),
            const DataColumn(label: Text('Etat')),
            const DataColumn(label: Text('Poste')),
            const DataColumn(label: Text('Déstination'))
          ]));
}
