import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test formulario',
      debugShowCheckedModeBanner: false,
      home: HomePageApp(title: 'Pagina de inicio'),
    );
  }
}



enum SinginCharacter { femenino, masculino, Otro }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class HomePageApp extends StatelessWidget {
  const HomePageApp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Column(
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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                '',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 207, 47, 248)),
              ),
              Image.network("https://i.imgur.com/knxT0t0.png", height: 200),
              const Text(''),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(20),
                        textStyle: const TextStyle(fontSize: 20)),
                    child: const Text('Inicia sesion!'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage(title: "Registro cliente")));
                    }),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(20),
                        textStyle: const TextStyle(fontSize: 20)),
                    child: const Text('Registrate!'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage(
                                  title: "Registro cliente")));
                    }),
              ),
            ]),
      ),
    );
  }
}

class _RegisterPageState extends State<RegisterPage> {
  SinginCharacter? _sex = SinginCharacter.femenino;

  String _nombre = '';
  final _formKey = GlobalKey<FormState>();
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Registrarse!!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Nombre',
                              hintStyle: TextStyle(fontWeight: FontWeight.w600),
                              fillColor: Color.fromARGB(255, 198, 198, 198),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.solid),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                              ),
                              filled: true),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor ingrese su nombre';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _nombre = value.toString();
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Apellidos',
                              hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                            if (value == null || value.isEmpty) {
                              return 'Por favor digite su apellido';
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Radio<SinginCharacter>(
                                  value: SinginCharacter.femenino,
                                  groupValue: _sex,
                                  onChanged: (SinginCharacter? value) {
                                    setState(() {
                                      _sex = value;
                                    });
                                  },
                                ),
                                const Text('Femenino')
                              ],
                            ),
                            Row(
                              children: [
                                Radio<SinginCharacter>(
                                  value: SinginCharacter.masculino,
                                  groupValue: _sex,
                                  onChanged: (SinginCharacter? value) {
                                    setState(() {
                                      _sex = value;
                                    });
                                  },
                                ),
                                const Text('Masculino')
                              ],
                            ),
                            Row(
                              children: [
                                Radio<SinginCharacter>(
                                  value: SinginCharacter.Otro,
                                  groupValue: _sex,
                                  onChanged: (SinginCharacter? value) {
                                    setState(() {
                                      _sex = value;
                                    });
                                  },
                                ),
                                const Text('Otro')
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
                              hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                            }
                            if (!regExp.hasMatch(value)) {
                              return "La contraseña debe tener al menos 8 caracteres, 1 letra mayúscula, 1 minúscula y 1 número y debe contener caracteres especiales.";
                            }
                            if (value.length <= 10) {
                              return 'La contraseña debe tener al menos 10 caracteres';
                            }
                            if (value.length >= 20) {
                              return 'La contraseña no debe de tener más de 20 caracteres.';
                            } else {
                              return null;
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: 'Confirmar contraseña',
                              hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
                            if (value == null || value.isEmpty) {
                              return 'Confirmar contraseña es requerido';
                            }
                            if (value != _password) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
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
                                          color: Color.fromARGB(255, 198, 198, 198),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Usuario registrado con exito!",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 198, 198, 198),),
                                        )
                                      ],
                                    ),
                                    duration:
                                        const Duration(milliseconds: 2000),
                                    width: 300,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 12, 195, 106),
                                  ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.black, // background (button) color
                                foregroundColor:
                                    Color.fromARGB(255, 255, 255, 255), // foreground (text) color
                              ),
                              child: const Text('Enviar')),
                        )),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}


