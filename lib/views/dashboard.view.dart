import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dashboard.controller.dart';
import 'package:uchuvalabs/configs.dart' as cg;

import '../widgets/buttons.widget.dart';

class DashboardView extends StatefulWidget {

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final dashboardController = context.watch<DashboardController>();
    dashboardController.size = MediaQuery.of(context).size;
    dashboardController.role = cg.role;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text('${cg.role}'),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  dashboardController.handleCreateAction(context);
                },
                child: Text(dashboardController.getCreateButtonText()),
              ),
              CustomButtonGeneral(
                  mediaWidth: dashboardController.size.width,
                  txtBtn: 'Reportar Novedad',
                  clickBtn: () {

                  },
                  buttonColor: cg.mainBackColorButton
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            dashboardController.getListTitle(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: dashboardController.itemsCrop.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      'Proyecto ${dashboardController.itemsCrop[index]}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    subtitle: Text(dashboardController.itemsCity[index]),
                    leading: Image.asset('assets/crop-logo.png'),
                    onTap: () {
                      dashboardController.showDetailModal(context, index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
