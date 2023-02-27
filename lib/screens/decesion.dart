import 'package:flutter/material.dart';

class Decesion extends StatefulWidget {
  const Decesion({Key? key}) : super(key: key);

  @override
  State<Decesion> createState() => _DecesionState();
}

class _DecesionState extends State<Decesion> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Flexible(child: Image.asset("assets/emailPassword.png")),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: emailController,
                onChanged: (value) {
                },
                showCursor: false,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          emailController.clear();
                        },
                        child: const Icon(Icons.close, color: Colors.black54)),
                    filled: true,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.fiber_manual_record,
                        color: Colors.green, size: 20),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              )),
          const SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                onChanged: (value) {
                },
                showCursor: false,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.close, color: Colors.black54),
                    filled: true,
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.fiber_manual_record,
                        color: Colors.green, size: 20),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              )),
        ]),
      ),
    );
  }
}
