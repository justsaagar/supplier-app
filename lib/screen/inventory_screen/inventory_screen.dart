import 'package:flutter/material.dart';
import 'package:supplier/app/widget/app_app_bar.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Inventory'),
    );
  }
}
