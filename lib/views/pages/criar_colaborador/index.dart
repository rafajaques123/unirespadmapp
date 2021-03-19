import 'package:flutter/material.dart';
import 'package:unirespadmapp/controllers/colaborador_controller.dart';
import 'package:unirespadmapp/data/models/colaborador_model.dart';

import 'package:unirespadmapp/views/components/flat_button_ext/index.dart';
import 'package:unirespadmapp/views/components/text_form_field_ext/index.dart';

// ignore: must_be_immutable
class CadastarColaboradorPage extends StatefulWidget {
  ColaboradorModel dadosIniciais;
  CadastarColaboradorPage({this.dadosIniciais});
  @override
  _CadastarColaboradorPageState createState() =>
      _CadastarColaboradorPageState();
}

class _CadastarColaboradorPageState extends State<CadastarColaboradorPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new ColaboradorController();

  @override
  void initState() {
    super.initState();
    iniciarDados();
  }

  void iniciarDados() {
    if (widget.dadosIniciais == null) return;
    setState(() {
      _controller.uidController.text = widget.dadosIniciais.id;
      _controller.nomeController.text = widget.dadosIniciais.nome;
      _controller.areaController.text = widget.dadosIniciais.area;
      _controller.emailController.text = widget.dadosIniciais.email;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ADICIONAR COLABORADOR'),
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
        
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Nome',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.edit),
                  controller: _controller.nomeController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Area de conhecimento',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.school),
                  controller: _controller.areaController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email),
                  controller: _controller.emailController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: FlatButtonExt(
                  text: 'Salvar',
                  onPressed: () {
                    _controller.salvar(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
