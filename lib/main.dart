import 'package:flutter/material.dart';
import 'package:truck_app/pages/login/login.dart';
import 'package:truck_app/utils/get_app_routes.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Truck app',
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Login(),
        routes: getAppRoutes());
  }
}
