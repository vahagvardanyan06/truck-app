import 'package:flutter/material.dart';
import 'package:truck_app/components/nav_bar.dart';

class GraphicsPage extends StatelessWidget {
  const GraphicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('graphics page'),
        ),
        bottomNavigationBar: NavBar(),
      )),
    );
  }
}
