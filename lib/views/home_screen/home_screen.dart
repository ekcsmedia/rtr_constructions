import 'package:flutter/material.dart';
import 'package:sattva_rtr_construction_split_wise/views/home_screen/widgets/app_bar_widget.dart';

import '../auth_screens/login_input_screen.dart';
import 'widgets/home_screen_body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarWidget(),
      ),
      body: const HomeScreenBodyWidget(),
    );
  }
}
