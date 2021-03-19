import 'package:flutter/material.dart';
import 'package:unirespadmapp/data/providers/fire_base_auth_provider.dart';
import 'package:unirespadmapp/routes/app_routes.dart';
import 'package:unirespadmapp/views/components/flat_button_ext/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('UNIRESP ADM'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xFF00CED1),
                Color(0xFF4682B4),
              ])),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                final auth = new FireBaseAuthProvider();
                auth.efetuarLogoff();
                Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
              })
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: FlatButtonExt(
                text: 'Solicitações',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.SOLICITACOES);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: FlatButtonExt(
                text: 'Colaboradores',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.COLABORADORES);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
