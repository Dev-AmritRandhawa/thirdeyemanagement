import 'package:flutter/material.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
          padding: const EdgeInsets.all(10),
width: MediaQuery.of(context).size.width/5,
          child: TextFormField(
          ),
        )
      ],),
    );
  }
}
