import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/listtransport_controller.dart';

class ListTransportWidgetTable extends StatelessWidget {
  const ListTransportWidgetTable({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<ListTransportsController>(
      builder: (controller) => PaginatedDataTable(
          source: controller.myData,
          rowsPerPage: 10,
          sortAscending: controller.sort,
          onPageChanged: (value) {
            controller.resetSelectedIndex();
          },
          onSelectAll: (value) {},
          primary: false,
          sortColumnIndex: controller.sortIndex,
          showFirstLastButtons: true,
          columnSpacing: 26,
          showCheckboxColumn: true,
          columns: getColumns(context, controller)));

  getColumns(BuildContext context, ListTransportsController controller) => [
        DataColumn(
            label: Text('N°',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            numeric: true),
        DataColumn(
            label: Text('Réf',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Date',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            }),
        DataColumn(
            label: Text('Heure',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Client',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            }),
        DataColumn(
            label: Text('Télephone',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Montant Produit',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            }),
        DataColumn(
            label: Text('Mnt Livr Interne',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            },
            tooltip: "Montant de Livraison Interne"),
        DataColumn(
            label: Text('Mnt Livr Externe',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            },
            tooltip: "Montant de Livraison Externe"),
        DataColumn(
            label: Text('Total',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            }),
        DataColumn(
            label: Text('Transporteur Externe',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            }),
        DataColumn(
            label: Text('Etat',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Poste',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Déstination',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            onSort: (columnIndex, ascending) {
              controller.onSortColumn(columnIndex, ascending);
            })
      ];
}
