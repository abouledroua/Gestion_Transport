import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/listtransport_controller.dart';
import '../../core/constant/sizes.dart';
import '../widgets/homepage/custom_appbar.dart';
import '../widgets/list_transport/emptylisttransport.dart';
import '../widgets/list_transport/list_transport_table_widget.dart';
import '../widgets/loadingbarwidget.dart';
import 'myscreen.dart';

class ListTransportPage extends StatelessWidget {
  const ListTransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myData = MyData();
    if (Get.isRegistered<ListTransportsController>()) {
      Get.delete<ListTransportsController>();
    }
    Get.put(ListTransportsController());
    return MyScreen(
        child: Column(children: [
      const CustomAppbar(),
      const SizedBox(height: appPadding),
      GetBuilder<ListTransportsController>(
          builder: (controller) => Visibility(
              visible: controller.loading,
              replacement: Visibility(
                  visible: controller.transports.isEmpty,
                  replacement: ListTransportWidgetTable(myData: myData),
                  child: const EmptyListTransports()),
              child: const LoadingBarWidget()))
    ]));
  }
}
