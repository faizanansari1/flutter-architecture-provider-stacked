import 'package:flutter/material.dart';
import 'package:flutter_architecture_provider_stacked/ui/views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider And Stacked",
      home: HomeView(),
    );
  }
}
