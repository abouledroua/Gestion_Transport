import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gestion_transport/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../core/class/user.dart';
import '../core/constant/color.dart';
import '../core/constant/data.dart';
import '../core/constant/routes.dart';
import '../core/constant/sizes.dart';
import '../core/services/settingservice.dart';

class LoginController extends GetxController {
  late TextEditingController userController, passController;
  String erreur = "";
  int type = 0;
  bool valider = false, wrongCredent = false, erreurServeur = false;

  Future<bool> onWillPop() async =>
      (await showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
                  title: Row(children: [
                    Icon(Icons.exit_to_app_sharp, color: red),
                    const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Etes-vous sur ?'))
                  ]),
                  content: const Text(
                      "Voulez-vous vraiment annuler l'authentification ?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Get.back(result: false),
                        child: Text('Non', style: TextStyle(color: red))),
                    TextButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoute.login);
                        },
                        child: Text('Oui', style: TextStyle(color: green)))
                  ]))) ??
      false;

  setValider(pValue) {
    valider = pValue;
    update();
  }

  updateType(int value) {
    type = value;
    update();
  }

  onValidate() {
    setValider(true);
    debugPrint("valider=$valider");
    String serverDir = AppData.getServerDirectory();
    var url = "$serverDir/EXIST_USER.php";
    debugPrint("url=$url");
    String userName = AppData.removeEspace(userController.text.toUpperCase());
    String password = AppData.removeEspace(passController.text.toUpperCase());
    Uri myUri = Uri.parse(url);
    http
        .post(myUri, body: {
          "BDD": AppData.dossier,
          "USERNAME": userName,
          "PASSWORD": password
        })
        .timeout(AppData.getTimeOut())
        .then((response) async {
          if (response.statusCode == 200) {
            debugPrint("responsebody=${response.body}");
            debugPrint("response=${response.toString()}");
            erreurServeur = false;
            wrongCredent = false;
            erreur = "";
            var responsebody = jsonDecode(response.body);
            User.idUser = 0;
            for (var m in responsebody) {
              createVarUser(
                  idUser: AppData.getInt(m, 'ID_USER'),
                  affichePrix: AppData.getInt(m, 'AFFICHE_PRIX') == 1,
                  caisse: AppData.getInt(m, 'CAISSE') == 1,
                  tresorerie: AppData.getInt(m, 'TRESORERIE') == 1,
                  reglementClient: AppData.getInt(m, 'REGLEMENT_CLIENT') == 1,
                  reglementFournisseur:
                      AppData.getInt(m, 'REGLEMENT_FOURNISSEUR') == 1,
                  livraison: AppData.getInt(m, 'LIVRAISON') == 1,
                  retour: AppData.getInt(m, 'RETOUR') == 1,
                  statistique: AppData.getInt(m, 'STATISTIQUE') == 1,
                  transport: AppData.getInt(m, 'TRANSPORT') == 1,
                  transaction: AppData.getInt(m, 'TRANSACTION') == 1,
                  parametre: AppData.getInt(m, 'PARAMETRE') == 1,
                  password: password,
                  userName: userName);
            }
            if (User.idUser == 0) {
              effacerLastUser();
              String msg = "Nom d' 'utilisateur ou mot de passe invalide !!!";
              wrongCredent = true;
              debugPrint(msg);
              setValider(false);
              AppData.mySnackBar(title: 'Login', message: msg, color: red);
            }
            setValider(false);
          } else {
            erreur = " seurveur 1";
            erreurServeur = true;
            AppData.mySnackBar(
                title: 'Login',
                message: "Probleme lors de la connexion avec le serveur !!!",
                color: red);
            debugPrint("Probleme lors de la connexion avec le serveur !!!");
            setValider(false);
          }
        })
        .catchError((error) {
          erreur = error.toString();
          erreurServeur = true;
          debugPrint("erreur onValidate: $error");
          debugPrint("Probleme de Connexion avec le serveur 33 !!!");
          setValider(false);
          debugPrint("error : ${error.toString()}");
        });
  }

  createVarUser(
      {required int idUser,
      required String userName,
      required String password,
      required bool caisse,
      required bool tresorerie,
      required bool livraison,
      required bool reglementClient,
      required bool reglementFournisseur,
      required bool retour,
      required bool statistique,
      required bool transport,
      required bool transaction,
      required bool parametre,
      required bool affichePrix}) async {
    User.idUser = idUser;
    User.username = userName;
    User.password = password;
    User.caisse = caisse;
    User.tresorerie = tresorerie;
    User.livraison = livraison;
    User.parametre = parametre;
    User.reglementClient = reglementClient;
    User.reglementFournisseur = reglementFournisseur;
    User.retour = retour;
    User.statistique = statistique;
    User.transport = transport;
    User.affichePrix = affichePrix;
    User.transaction = transaction;

    debugPrint("Its Ok ----- Connected ----------------");

    SettingServices c = Get.find();
    c.sharedPrefs.setString('LastUser', userName);
    c.sharedPrefs.setString('LastPass', password);
    c.sharedPrefs.setBool('LastConnected', true);
    // String privacy = c.sharedPrefs.getString('Privacy${User.idUser}') ?? "";
    userController.text = "";
    passController.text = "";
    valider = false;
    // if (privacy.isEmpty) {
    //   debugPrint("Going to Privacy");
    //   await Get.toNamed(AppRoute.privacy);
    // }
    int index = c.sharedPrefs.getInt('CurrentIndex') ?? 0;
    HomeController controller = Get.find();
    controller.setIndex(newIndex: index, firstGo: true);
  }

  @override
  void onInit() {
    WidgetsFlutterBinding.ensureInitialized();
    initConnect();
    super.onInit();
  }

  initConnect() {
    setSizeScreen(Get.context);
    AppData.reparerBDD(showToast: false);
    type = 0;
    //Get.reset();
    userController = TextEditingController();
    passController = TextEditingController();
    erreurServeur = false;
    wrongCredent = false;
    SettingServices c = Get.find();
    //effacerLastUser();
    String userPref = c.sharedPrefs.getString('LastUser') ?? "";
    String passPref = c.sharedPrefs.getString('LastPass') ?? "";
    bool connect = c.sharedPrefs.getBool('LastConnected') ?? false;
    if (userPref.isNotEmpty && connect) {
      userController.text = userPref;
      passController.text = passPref;
      onValidate();
    }
  }

  effacerLastUser() {
    SettingServices c = Get.find();
    c.sharedPrefs.setString('LastUser', "");
    c.sharedPrefs.setString('LastPass', "");
    c.sharedPrefs.setBool('LastConnected', false);
  }

  @override
  void onClose() {
    userController.dispose();
    passController.dispose();
    super.onClose();
  }
}
