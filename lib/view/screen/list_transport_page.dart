import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/listtransport_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/sizes.dart';
import '../../core/mydivider.dart';
import '../widgets/homepage/custom_appbar.dart';
import '../widgets/list_transport/emptylisttransport.dart';
import '../widgets/list_transport/list_transport_table_widget.dart';
import '../widgets/loadingbarwidget.dart';
import 'myscreen.dart';

class ListTransportPage extends StatelessWidget {
  const ListTransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<ListTransportsController>()) {
      Get.delete<ListTransportsController>();
    }
    Get.put(ListTransportsController());
    return MyScreen(
        child: GetBuilder<ListTransportsController>(
            builder: (controller) => Column(children: [
                  const CustomAppbar(),
                  const SizedBox(height: appPadding),
                  actionButton(context),
                  if (!controller.loading && !controller.filter)
                    filterWidget(context, controller),
                  if (controller.loading) const LoadingBarWidget(),
                  if (!controller.loading && controller.transports.isEmpty)
                    const EmptyListTransports(),
                  if (!controller.loading && controller.transports.isNotEmpty)
                    const ListTransportWidgetTable()
                ])));
  }

  GetBuilder<ListTransportsController> actionButton(BuildContext context) =>
      GetBuilder<ListTransportsController>(
          builder: (controller) => Row(children: [
                Expanded(
                    child: Text('Liste des Transports',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center)),
                if (controller.selectIndex > -1)
                  IconButton(
                      tooltip: "Imprimer",
                      onPressed: () {
                        ListTransportsController controller = Get.find();
                        controller.getList(showMessage: true);
                      },
                      icon: const Icon(Icons.print_outlined, color: purple)),
                if (controller.selectIndex > -1) const MyDivider(),
                if (controller.selectIndex > -1)
                  IconButton(
                      tooltip: "Supprimer",
                      onPressed: () {
                        ListTransportsController controller = Get.find();
                        controller.getList(showMessage: true);
                      },
                      icon: Icon(Icons.delete_forever, color: red)),
                if (controller.selectIndex > -1)
                  IconButton(
                      tooltip: "Modifier",
                      onPressed: () {
                        ListTransportsController controller = Get.find();
                        controller.getList(showMessage: true);
                      },
                      icon: const Icon(Icons.edit_document, color: blue2)),
                IconButton(
                    tooltip: "Ajouter",
                    onPressed: () {
                      ListTransportsController controller = Get.find();
                      controller.getList(showMessage: true);
                    },
                    icon: const Icon(Icons.add_circle_outline_sharp,
                        color: green2)),
                const MyDivider(),
                IconButton(
                    tooltip: "Imprimer la Liste",
                    onPressed: () {
                      ListTransportsController controller = Get.find();
                      controller.getList(showMessage: true);
                    },
                    icon: const Icon(Icons.list_alt_outlined, color: black)),
                IconButton(
                    tooltip: "Actualiser",
                    onPressed: () {
                      ListTransportsController controller = Get.find();
                      controller.getList(showMessage: true);
                    },
                    icon: const Icon(Icons.refresh)),
                IconButton(
                    tooltip: controller.filter ? "Annuler Filtre" : "Filtrer",
                    onPressed: () {
                      ListTransportsController controller = Get.find();
                      controller.filtrer();
                    },
                    icon: Icon(
                        controller.filter
                            ? Icons.filter_alt_off_rounded
                            : Icons.filter_alt_rounded,
                        color: controller.filter ? grey : amber))
              ]));

  filterWidget(BuildContext context, ListTransportsController controller) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const SizedBox(width: appPadding),
        SizedBox(
            width: 100,
            child: myDropDown(
                label: 'Exercice',
                value: controller.dropExercice,
                items: controller.myDropExerciceList,
                onChanged: (value) {
                  controller.updateDropExerciceValue(value);
                },
                onClear: () {
                  controller.updateDropExerciceValue(null);
                },
                hint: "Choisir l'Exercice")),
        const SizedBox(width: appPadding),
        Expanded(
            child: myTextField(
                controller: controller.queryClientController,
                context: context,
                label: "Client")),
        const SizedBox(width: appPadding),
        Expanded(
            child: myTextField(
                controller: controller.queryTranspExterneController,
                context: context,
                label: "Transporteur Externe")),
        const SizedBox(width: appPadding),
        SizedBox(
            width: 150,
            child: myTextField(
                controller: controller.queryDateController,
                context: context,
                label: "Date",
                readOnly: true)),
        const SizedBox(width: appPadding),
        const SizedBox(width: appPadding),
        Expanded(
            child: myDropDown(
                label: 'Destination',
                value: controller.dropDestination,
                items: controller.myDropDestinationList,
                onChanged: (value) {
                  controller.updateDropDestinationValue(value);
                },
                onClear: () {
                  controller.updateDropDestinationValue(null);
                },
                hint: "Choisir la Déstination")),
        const SizedBox(width: appPadding),
        SizedBox(
            width: 100,
            child: myDropDown(
                label: 'Etat',
                value: controller.dropEtat,
                items: controller.myDropEtatList,
                onChanged: (value) {
                  controller.updateDropEtatValue(value);
                },
                hint: "Choisir l'Etat"))
      ]);

  TextField myTextField(
      {required TextEditingController controller,
      required BuildContext context,
      bool readOnly = false,
      required String label}) {
    return TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
            hintText: label,
            helperStyle: Theme.of(context).textTheme.titleMedium,
            fillColor: secondaryColor,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            prefixIcon: Icon(Icons.search, color: textColor.withOpacity(0.5))));
  }

  myDropDown(
          {required String label,
          required String? value,
          required List<DropdownMenuItem<dynamic>>? items,
          required Function(dynamic) onChanged,
          Function()? onClear,
          required String hint}) =>
      SizedBox(
          height: 50,
          child: DropdownButtonHideUnderline(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(children: [
                    Expanded(
                        child: DropdownButton(
                            items: items,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(5),
                            hint: Text(hint),
                            value: value,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: black),
                            iconSize: 0,
                            iconEnabledColor: grey,
                            onChanged: onChanged)),
                    InkWell(
                        onTap: onClear,
                        child: Ink(child: const Icon(Icons.clear, color: grey)))
                  ]))));
}
