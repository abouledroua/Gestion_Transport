// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controller/ficheactivation_controller.dart';
// import '../../controller/home_controller.dart';
// import '../../core/class/user.dart';
// import '../../core/constant/color.dart';
// import '../../core/constant/data.dart';
// import '../../core/constant/image_asset.dart';
// import '../../core/constant/routes.dart';
// import '../widgets/homepage/homepagemybutton.dart';
// import 'mywidget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) => MyWidget(
//       backgroundColor: greyFonce,
//       drawer: AppData.myDrawer(context),
//       title: "Page d'Acceuil",
//       child: WillPopScope(
//           onWillPop: onWillPop,
//           child: ListView(children: [
//             const SizedBox(height: 14),
//             Center(
//                 child: Text('Listes',
//                     style: Theme.of(context).textTheme.headlineLarge)),
//             GridView(
//                 primary: false,
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 children: [
//                   MyButtonHomePage(
//                       text: 'Liste des Produits',
//                       image: AppImageAsset.product,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listProduit, arguments: {});
//                       }),
//                   MyButtonHomePage(
//                       text: 'Etat de Stock',
//                       image: AppImageAsset.stock,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listProduit, arguments: {
//                           'FILTER': true,
//                           'SELECT_PRODUIT': false
//                         });
//                       })
//                 ]),
//             if (User.transport)
//               Center(
//                   child: Text('Achat',
//                       style: Theme.of(context).textTheme.headlineLarge)),
//             // if (User.achat)
//             GridView(
//                 shrinkWrap: true,
//                 primary: false,
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 children: [
//                   MyButtonHomePage(
//                       text: "Fournisseurs",
//                       image: AppImageAsset.fournisseur,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listPersonne,
//                             arguments: {'TYPE': 2});
//                       }),
//                   MyButtonHomePage(
//                       text: 'Bon de Réception',
//                       image: AppImageAsset.br,
//                       onTap: () {
//                         debugPrint('br');
//                         Get.toNamed(AppRoute.listFactures,
//                             arguments: {'TYPE': 1});
//                       }),
//                   MyButtonHomePage(
//                       text: "Facture d'achat",
//                       image: AppImageAsset.factureAchat,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listFactures,
//                             arguments: {'TYPE': 2});
//                       })
//                 ]),
//             // if (User.vente)
//             Center(
//                 child: Text('Vente',
//                     style: Theme.of(context).textTheme.headlineLarge)),
//             // if (User.vente)
//             GridView(
//                 shrinkWrap: true,
//                 primary: false,
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 children: [
//                   MyButtonHomePage(
//                       text: 'Clients',
//                       image: AppImageAsset.client,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listPersonne,
//                             arguments: {'TYPE': 1});
//                       }),
//                   MyButtonHomePage(
//                       text: 'Facture Proforma',
//                       image: AppImageAsset.proforma,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listFactures,
//                             arguments: {'TYPE': 3});
//                       }),
//                   MyButtonHomePage(
//                       text: 'Bon de Commande',
//                       image: AppImageAsset.bc,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listFactures,
//                             arguments: {'TYPE': 4});
//                       }),
//                   MyButtonHomePage(
//                       text: 'Bon de Livraison',
//                       image: AppImageAsset.bl,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listFactures,
//                             arguments: {'TYPE': 5});
//                       }),
//                   MyButtonHomePage(
//                       text: 'Facture de Vente',
//                       image: AppImageAsset.factureVente,
//                       onTap: () {
//                         Get.toNamed(AppRoute.listFactures,
//                             arguments: {'TYPE': 6});
//                       })
//                 ]),
//             // if (User.reglement || User.tresorerie)
//             Center(
//                 child: Text('Trésorerie',
//                     style: Theme.of(context).textTheme.headlineLarge)),
//             // if (User.reglement || User.tresorerie)
//             GridView(
//                 primary: false,
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 children: [
//                   if (User.reglementFournisseur)
//                     MyButtonHomePage(
//                         text: "Régl. Fournisseurs",
//                         image: AppImageAsset.paiementFournisseur,
//                         onTap: () {
//                           AppData.mySnackBar(
//                               title: 'Page Acceuil',
//                               message: 'En cours de développement ...',
//                               color: orange);
//                         }),
//                   if (User.reglementClient)
//                     MyButtonHomePage(
//                         text: 'Régl. Clients',
//                         image: AppImageAsset.paiementClient,
//                         onTap: () {
//                           AppData.mySnackBar(
//                               title: 'Page Acceuil',
//                               message: 'En cours de développement ...',
//                               color: orange);
//                         }),
//                   if (User.transaction)
//                     MyButtonHomePage(
//                         text: 'Transactions',
//                         image: AppImageAsset.transaction,
//                         onTap: () {
//                           AppData.mySnackBar(
//                               title: 'Page Acceuil',
//                               message: 'En cours de développement ...',
//                               color: orange);
//                         }),
//                   if (User.statistique)
//                     MyButtonHomePage(
//                         text: 'Statistiques',
//                         image: AppImageAsset.stats,
//                         onTap: () {
//                           AppData.mySnackBar(
//                               title: 'Page Acceuil',
//                               message: 'En cours de développement ...',
//                               color: orange);
//                         }),
//                   if (User.caisse)
//                     MyButtonHomePage(
//                         text: 'Caisse',
//                         image: AppImageAsset.caisse,
//                         onTap: () {
//                           AppData.mySnackBar(
//                               title: 'Page Acceuil',
//                               message: 'En cours de développement ...',
//                               color: orange);
//                         }),
//                 ]),
//             Center(
//                 child: Text('Général',
//                     style: Theme.of(context).textTheme.headlineLarge)),
//             GridView(
//                 shrinkWrap: true,
//                 primary: false,
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 children: [
//                   if (User.parametre)
//                     MyButtonHomePage(
//                         text: 'Paramêtres', image: AppImageAsset.parametre),
//                   MyButtonHomePage(
//                       text: 'Réparer Données',
//                       image: AppImageAsset.repair,
//                       onTap: () {
//                         AppData.reparerBDD(showToast: true);
//                       }),
//                   GetBuilder<HomeController>(
//                       builder: (controller) => Visibility(
//                           visible: controller.isVersionDemo,
//                           child: MyButtonHomePage(
//                               text: 'Activer Application',
//                               image: AppImageAsset.activation,
//                               onTap: () {
//                                 if (Get.isRegistered<
//                                     FicheActivationController>()) {
//                                   Get.delete<FicheActivationController>();
//                                 }
//                                 Get.toNamed(AppRoute.activation)!.then((value) {
//                                   setState(() {});
//                                 });
//                               }))),
//                   MyButtonHomePage(
//                       text: 'Info App',
//                       image: AppImageAsset.apropos,
//                       onTap: () {
//                         Get.toNamed(AppRoute.apropos);
//                       }),
//                   MyButtonHomePage(
//                       text: 'Déconnecter',
//                       image: AppImageAsset.logout,
//                       onTap: () {
//                         AppData.logout();
//                       })
//                 ])
//           ])));

//   Future<bool> onWillPop() async => false;
// }
