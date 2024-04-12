import 'package:flutter/material.dart';
import 'package:sattva_rtr_construction_split_wise/views/home_screen/widgets/drawer_menu_widget.dart';
import 'package:sattva_rtr_construction_split_wise/views/home_screen/widgets/transaction_summary_widget.dart';

import 'customer_list_widget.dart';

class HomeScreenBodyWidget extends StatelessWidget {
  const HomeScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerMenuWidget(),
              CustomerListWidget(),
              TransactionSummaryWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
