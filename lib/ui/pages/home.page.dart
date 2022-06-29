import 'package:flutter/material.dart';

import '../widgets/main.drawer.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text("Home Page"),),
      body: Center(
        child: Text("Home Page", style: Theme.of(context).textTheme.headline4,),
      ),
    );




  }
}