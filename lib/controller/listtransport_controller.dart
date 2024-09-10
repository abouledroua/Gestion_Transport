import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../core/class/transport.dart';
import '../core/constant/color.dart';
import '../core/constant/data.dart';
import '../core/constant/sizes.dart';

class ListTransportsController extends GetxController {
  bool loading = false, error = false, searching = false, filter = false;
  String query = "";
  String queryEtat = "En Stock",
      queryDesignation = "",
      queryFamily = "",
      queryMarque = "",
      queryCouleur = "",
      queryUnite = "";
  List<Transport> transports = [];
  late ScrollController scrolController;

  emptyfilters() {
    queryCouleur = "";
    queryDesignation = "";
    queryEtat = "En Stock";
    queryFamily = "";
    queryMarque = "";
    queryUnite = "";
    update();
  }

  myActions() => [
        Builder(builder: (context) {
          return IconButton(
              icon: Icon(filter ? Icons.filter_alt_outlined : Icons.search,
                  color: white),
              tooltip: filter ? 'Filtrer' : 'Recherche',
              onPressed: () {
                if (filter) {
                  Scaffold.of(context).openDrawer();
                } else {
                  if (searching) {
                    updateQuery("");
                  }
                  updateSearching();
                }
              });
        }),
        IconButton(
            icon: const Icon(Icons.refresh, color: white),
            tooltip: 'Actualiser',
            onPressed: () {
              getList(showMessage: true);
            })
      ];

  updateBooleans({required newloading, required newerror}) {
    loading = newloading;
    error = newerror;
    update();
  }

  updateQuery(String newValue) {
    query = newValue;
    update();
  }

  updateSearching() {
    searching = !searching;
    update();
  }

  Future getList({required bool showMessage}) async {
    if (!loading) {
      updateBooleans(newloading: true, newerror: false);
      String serverDir = AppData.getServerDirectory();
      var url = "$serverDir/GET_TRANSPORTS.php";
      debugPrint("url=$url");
      Uri myUri = Uri.parse(url);
      http
          .post(myUri, body: {"BDD": AppData.dossier})
          .timeout(AppData.getTimeOut())
          .then((response) async {
            if (response.statusCode == 200) {
              transports.clear();
              var responsebody = jsonDecode(response.body);
              Transport e;
              for (var m in responsebody) {
                e = Transport(
                    date: m['DATE'],
                    destination: m['DESTINATION'],
                    heure: m['HEURE'],
                    nomClient: m['NOM_CLIENT'],
                    nomTransporteurExterne: m['NOM_TRANS_EXTERNE'],
                    poste: m['DES_POSTE'],
                    tel1Client: m['TEL1_CLIENT'],
                    tel2Client: m['TEL2_CLIENT'],
                    username: m['USERNAME'],
                    etat: AppData.getInt(m, 'ETAT'),
                    exercice: AppData.getInt(m, 'EXERCICE'),
                    idTransport: AppData.getInt(m, 'ID'),
                    idTransporteurExterne:
                        AppData.getInt(m, 'ID_TRANSPORTEUR_EXTERNE'),
                    idClient: AppData.getInt(m, 'ID_CLIENT'),
                    montantLivrExterne:
                        AppData.getDouble(m, 'MONTANT_TRANSPORT_EXTERNE'),
                    montantLivrInterne:
                        AppData.getDouble(m, 'MONTANT_LIV_INTERNE'),
                    montantProduit: AppData.getDouble(m, 'MONTANT_PRODUIT'),
                    total: AppData.getDouble(m, 'TOTAL'));
                transports.add(e);
              }
              updateBooleans(newloading: false, newerror: false);
            } else {
              updateBooleans(newloading: false, newerror: true);
            }
          })
          .catchError((error) {
            debugPrint("erreur getProduits: $error");
            updateBooleans(newloading: false, newerror: true);
          });
    }
  }

  deleteProduit(Transport item) async {
    // String serverDir = AppData.getServerDirectory();
    // var url = "$serverDir/DELETE_PRODUIT.php";
    // debugPrint(url);
    // Uri myUri = Uri.parse(url);
    // http
    //     .post(myUri, body: {
    //       "BDD": AppData.dossier,
    //       "ID_PRODUIT": item.idProduit.toString()
    //     })
    //     .timeout(AppData.getTimeOut())
    //     .then((response) async {
    //       if (response.statusCode == 200) {
    //         var result = response.body;
    //         if (result != "0") {
    //           getProduits(showMessage: false);
    //           Get.back();
    //           AppData.mySnackBar(
    //               title: 'Liste des produits',
    //               message: "Produit supprimé ...",
    //               color: AppColor.green);
    //         } else {
    //           AppData.mySnackBar(
    //               title: 'Liste des produits',
    //               message: "Probleme lors de la suppression !!!",
    //               color: AppColor.red);
    //         }
    //       } else {
    //         AppData.mySnackBar(
    //             title: 'Liste des produits',
    //             message: "Probleme de Connexion avec le serveur !!!",
    //             color: AppColor.red);
    //       }
    //     })
    //     .catchError((error) {
    //       debugPrint("erreur deleteProduit: $error");
    //       AppData.mySnackBar(
    //           title: 'Liste des produits',
    //           message: "Probleme de Connexion avec le serveur !!!",
    //           color: AppColor.red);
    //     });
  }

  @override
  void onClose() {
    scrolController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    setSizeScreen(Get.context);
    scrolController = ScrollController();
    getList(showMessage: true);
    super.onInit();
  }
}

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    ListTransportsController controller = Get.find();
    final List<Transport> listTransport = controller.transports;
    Transport item = listTransport[index];
    return DataRow(cells: [
      DataCell(Text(item.idTransport.toString())),
      DataCell(Text("${item.exercice}/${item.idTransport}")),
      DataCell(Text(item.date)),
      DataCell(Text(item.heure)),
      DataCell(Text(item.nomClient)),
      DataCell(Text(
          "${item.tel1Client} ${item.tel1Client.removeAllWhitespace.isNotEmpty || item.tel2Client.removeAllWhitespace.isNotEmpty ? " / " : ""} ${item.tel2Client.removeAllWhitespace}")),
      DataCell(Text("${AppData.formatMoney(item.montantProduit)} DA")),
      DataCell(Text('${AppData.formatMoney(item.montantLivrInterne)} DA')),
      DataCell(Text('${AppData.formatMoney(item.montantLivrExterne)} DA')),
      DataCell(Text('${AppData.formatMoney(item.total)} DA')),
      DataCell(Text(item.nomTransporteurExterne)),
      DataCell(Text(item.etat == 1 ? "Actif" : "Annuler")),
      DataCell(Text(item.poste)),
      DataCell(Text(item.destination))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount {
    ListTransportsController controller = Get.find();
    final List<Transport> listTransport = controller.transports;
    return listTransport.length;
  }

  @override
  int get selectedRowCount => 0;
}
