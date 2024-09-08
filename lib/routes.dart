import 'package:flutter/material.dart';

import 'core/constant/routes.dart';
import 'view/screen/dash_board.dart';
// import 'view/screen/homepage.dart';
import 'view/screen/login.dart';
import 'view/screen/privacy_policy.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.login: (context) => const LoginPage(),
  AppRoute.homePage: (context) => const DashBoardScreen(),
  AppRoute.privacy: (context) => const PrivacyPolicy(),
  // AppRoute.apropos: (context) => const AProposView(),
  // AppRoute.activation: (context) => const FicheActivation(),
  // AppRoute.ficheDonnee: (context) => const FicheDonnee(),
  // AppRoute.fichePersonne: (context) => const FichePersonne(),
  // AppRoute.ficheProduit: (context) => const FicheProduit(),
  // AppRoute.ficheFacture: (context) => const FicheFacture(),
  // AppRoute.detailsPersonne: (context) => const DetailsPersonneView(),
  // AppRoute.detailsProduit: (context) => const DetailsProduitView(),
  // AppRoute.listDonnee: (context) => const ListDonnee(),
  // AppRoute.listPersonne: (context) => const ListPersonne(),
  // AppRoute.listProduit: (context) => const ListProduits(),
  // AppRoute.listFactures: (context) => const ListFactures(),
  // AppRoute.ficheServerName: (context) => const FicheServerName(),
  // AppRoute.connectDossier: (context) => const ConnectDossier()
};
