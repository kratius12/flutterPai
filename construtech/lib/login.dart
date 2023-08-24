import 'package:flutter/material.dart';

import 'servicios.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  String _nombre = '';
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Column(
          children: [
            Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 18, color: Colors.indigo),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'inicia sesion para adquirir servicios!!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepOrange),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('',
                    style: TextStyle(color: Colors.indigo)),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.w600),
                                fillColor: Color.fromARGB(255, 198, 198, 198),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                filled: true),
                            validator: (value) {
                              String pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = RegExp(pattern);
                              if (value!.isEmpty) {
                                return "El correo es requerido";
                              } else if (!regExp.hasMatch(value)) {
                                return "Correo invalido";
                              } else {
                                return null;
                              }
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'Contraseña',
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.w600),
                                fillColor: Color.fromARGB(255, 198, 198, 198),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                filled: true),
                            validator: (value) {
                              String pattern =
                                  r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$';
                              RegExp regExp = RegExp(pattern);
                              if (value!.isEmpty) {
                                return "La contraseña es requerida";
                              } else {
                                return null;
                              }
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.purple,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Usuario logueado con exito!",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                        ],
                                      ),
                                      duration:
                                      const Duration(milliseconds: 2000),
                                      width: 300,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 10),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(3.0),
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                          255, 12, 195, 106),
                                    ));               
                                  }
                                  if(_formKey.currentState!.validate()){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const ServicioPage(
                                              title: "Solicitar servicio")));
                                }},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Colors.black, // background (button) color
                                  foregroundColor:
                                  Colors.white, // foreground (text) color
                                ),
                                child: const Text('Enviar')),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}