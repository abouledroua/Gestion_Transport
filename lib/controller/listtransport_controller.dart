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
  bool loading = false, error = false, filter = false, sort = false;
  String queryClient = "";
  String? dropExercice, dropEtat, dropDestination;
  List<DropdownMenuItem> myDropEtatList = [],
      myDropDestinationList = [],
      myDropExerciceList = [];
  int sortIndex = 0, selectIndex = -1;
  late TextEditingController queryClientController,
      queryDateController,
      queryTranspExterneController;
  List<Transport> transports = [];
  late MyData myData;

  DropdownMenuItem myDropMenuItem(String label) => DropdownMenuItem(
      value: label,
      child: Center(child: Text(label, textAlign: TextAlign.center)));

  updateDropExerciceValue(value) {
    dropExercice = value;
    update();
  }

  updateDropDestinationValue(value) {
    dropDestination = value;
    update();
  }

  updateDropEtatValue(value) {
    dropEtat = value;
    update();
  }

  initDropExercice() {
    myDropExerciceList = [];
    myDropExerciceList.add(myDropMenuItem('Tous'));
    dropExercice = 'Tous';
  }

  initDropEtat() {
    myDropEtatList = [];
    myDropEtatList.add(myDropMenuItem('Tous'));
    dropEtat = 'Tous';
  }

  initDropDestination() {
    myDropDestinationList = [];
    myDropDestinationList.add(myDropMenuItem('Tous'));
    dropDestination = null;
  }

  onSortColumn(int columnIndex, bool ascending) {
    sortIndex = columnIndex;
    switch (columnIndex) {
      case 2:
        if (sort) {
          transports.sort((a, b) => a.date.compareTo(b.date));
        } else {
          transports.sort((a, b) => b.date.compareTo(a.date));
        }
        break;
      case 4:
        if (sort) {
          transports.sort((a, b) => a.nomClient.compareTo(b.date));
        } else {
          transports.sort((a, b) => b.nomClient.compareTo(a.date));
        }
        break;
      case 6:
        if (sort) {
          transports
              .sort((a, b) => a.montantProduit.compareTo(b.montantProduit));
        } else {
          transports
              .sort((a, b) => b.montantProduit.compareTo(a.montantProduit));
        }
        break;
      case 7:
        if (sort) {
          transports.sort(
              (a, b) => a.montantLivrInterne.compareTo(b.montantLivrInterne));
        } else {
          transports.sort(
              (a, b) => b.montantLivrInterne.compareTo(a.montantLivrInterne));
        }
        break;
      case 8:
        if (sort) {
          transports.sort(
              (a, b) => a.montantLivrExterne.compareTo(b.montantLivrExterne));
        } else {
          transports.sort(
              (a, b) => b.montantLivrExterne.compareTo(a.montantLivrExterne));
        }
        break;
      case 9:
        if (sort) {
          transports.sort((a, b) => a.total.compareTo(b.total));
        } else {
          transports.sort((a, b) => b.total.compareTo(a.total));
        }
        break;
      case 10:
        if (sort) {
          transports.sort((a, b) =>
              a.nomTransporteurExterne.compareTo(b.nomTransporteurExterne));
        } else {
          transports.sort((a, b) =>
              b.nomTransporteurExterne.compareTo(a.nomTransporteurExterne));
        }
        break;
      case 13:
        if (sort) {
          transports.sort((a, b) => a.destination.compareTo(b.destination));
        } else {
          transports.sort((a, b) => b.destination.compareTo(a.destination));
        }
        break;
      default:
    }
    sort = !sort;
    myData = MyData();
    update();
  }

  updateBooleans({required newloading, required newerror}) {
    loading = newloading;
    error = newerror;
    update();
  }

  updateClientQuery(String newValue) {
    queryClient = newValue;
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
              selectIndex = -1;
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
              myData = MyData();
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
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    setSizeScreen(Get.context);
    queryClientController = TextEditingController();
    queryTranspExterneController = TextEditingController();
    queryDateController = TextEditingController();
    initDropExercice();
    initDropEtat();
    initDropDestination();
    getList(showMessage: true);
    super.onInit();
  }

  void selectRow(int index) {
    selectIndex = index;
    myData = MyData();
    // AppData.mySnackBar(message: index, color: red, title: index);
    update();
  }

  void resetSelectedIndex() {
    selectIndex = -1;
    update();
  }

  void filtrer() {
    filter = !filter;
    update();
  }

  @override
  void onClose() {
    queryClientController.dispose();
    queryTranspExterneController.dispose();
    queryDateController.dispose();
    super.onClose();
  }
}

class MyData extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    ListTransportsController controller = Get.find();
    final List<Transport> listTransport = controller.transports;
    Transport item = listTransport[index];
    TextStyle? styleText = (index == controller.selectIndex)
        ? Theme.of(Get.context!)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold, color: black)
        : Theme.of(Get.context!)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.normal, color: greyblack);
    return DataRow(
        color: WidgetStateProperty.all<Color>(item.etat == 1
            ? Colors.transparent
            : item.etat == 2
                ? yellow
                : item.etat == 3
                    ? red
                    : item.etat == 4
                        ? greenClair
                        : amber),
        selected: (index == controller.selectIndex),
        onSelectChanged: (value) {
          if (value != null && value) {
            controller.selectRow(index);
          }
        },
        cells: [
          DataCell(Text(item.idTransport.toString(), style: styleText)),
          DataCell(
              Text("${item.exercice}/${item.idTransport}", style: styleText)),
          DataCell(Text(item.date, style: styleText)),
          DataCell(Text(item.heure, style: styleText)),
          DataCell(Text(item.nomClient,
              textAlign: TextAlign.right, style: styleText)),
          DataCell(Text(
              AppData.formatPhoneNumber(
                  telNumber1: item.tel1Client, telNumber2: item.tel2Client),
              style: styleText)),
          DataCell(Text("${AppData.formatMoney(item.montantProduit)} DA",
              style: styleText)),
          DataCell(Text('${AppData.formatMoney(item.montantLivrInterne)} DA',
              style: styleText)),
          DataCell(Text('${AppData.formatMoney(item.montantLivrExterne)} DA',
              style: styleText)),
          DataCell(
              Text('${AppData.formatMoney(item.total)} DA', style: styleText)),
          DataCell(Text(item.nomTransporteurExterne, style: styleText)),
          DataCell(Text(
              item.etat == 1
                  ? "En Cours"
                  : item.etat == 2
                      ? "Livré Partiellement"
                      : item.etat == 3
                          ? "Annulé"
                          : item.etat == 4
                              ? "Livré Completement"
                              : "Archivé",
              style: styleText)),
          DataCell(Text(item.poste, style: styleText)),
          DataCell(Text(item.destination, style: styleText))
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount {
    ListTransportsController controller = Get.find();
    return controller.transports.length;
  }

  @override
  int get selectedRowCount => 0;
}
