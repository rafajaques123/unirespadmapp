import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unirespadmapp/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirebaseAppInit());
}

class FirebaseAppInit extends StatelessWidget {
  //Inicializa o Firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //verifica se tem erros
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text('Ocorreu um erro ao inicializar o Firebase'),
            ),
          );
        }
        //se tudo der certo abre a aokicaçao
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        //Mostrar carregando
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNIRESP ADM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.LOGIN,
      routes: AppRoutes.routes,
    );
  }
}
