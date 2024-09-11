import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/listtransport_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/sizes.dart';

class EmptyListTransports extends StatelessWidget {
  const EmptyListTransports({super.key});

  @override
  Widget build(BuildContext context) {
    ListTransportsController controller = Get.find();
    return SizedBox(
        height: fullHeight / 2,
        child: Center(
            child: Container(
                color: white,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                              controller.error
                                  ? "Erreur de connexion !!!"
                                  : "Aucun Transport !!!!",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: controller.error ? red : green,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: white, backgroundColor: produit),
                          onPressed: () {
                            controller.getList(showMessage: true);
                          },
                          icon: const Icon(Icons.refresh, color: white),
                          label: const Text("Actualiser"))
                    ]))));
  }
}
