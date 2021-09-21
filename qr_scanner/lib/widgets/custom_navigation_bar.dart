import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uIProvider = Provider.of<UIProvider>(context);
    return BottomNavigationBar(
      onTap: (int i) => uIProvider.selectedMenuOpt = i,
      currentIndex: uIProvider.selectedMenuOpt,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones')
      ],
      backgroundColor: Colors.grey,
    );
  }
}
