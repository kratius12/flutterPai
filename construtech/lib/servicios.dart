import 'package:construtech/main.dart';
import 'package:flutter/material.dart';
class ServicioPage extends StatefulWidget{
  const ServicioPage({super.key, required this.title});

  final String title;

  @override
  State<ServicioPage> createState()=> _ServicioPageState();
}


class _ServicioPageState extends State<ServicioPage>{

  String _servicio = '';
  final _formKey = GlobalKey<FormState>();
  String _fecha = "";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text ("sapo hijueputa"),
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: Colors.black
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            }else{
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: Drawer(
        child: ListView (

          padding: EdgeInsets.zero,
          children: <Widget> [
            DrawerHeader(
              child:Text('Menu',
              style: TextStyle(color:  Colors.blue),),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 190, 227),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Mi perfil'),
              
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MiPerfil()));
              }
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Solicitar Cita'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MiPerfil()));
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Obras y tiempos'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MiPerfil()));
              },
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Cerrar sesión'),
              onTap: (){
                Navigator.pop(context);
              },
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
                  'Solicita servicio',
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
                                hintText: 'Que servicio necesitas?',
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
                              if (value!.isEmpty) {
                                return "Nombre del servicio es requerido";
                              } else {
                                return null;
                              }
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'En que fecha podemos visitarte?',
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
                              if (value!.isEmpty) {
                                return "Fecha del servicio es requerida";
                              } else {
                                return null;
                              }
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: '¿Cual es la direccion?',
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
                              if (value!.isEmpty) {
                                return "¿Direccion del servicio es requerida";
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
                                            "Servicio solicitado con exito!",
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
                                  if (_formKey.currentState!.validate()) {
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
                                child: const Text('Solicitar')),
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

class MiPerfil extends StatelessWidget{
  const MiPerfil ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test formulario',
      debugShowCheckedModeBanner: false,
      home: HomePageApp(title: 'Pagina de inicio'),
    );
  }

}